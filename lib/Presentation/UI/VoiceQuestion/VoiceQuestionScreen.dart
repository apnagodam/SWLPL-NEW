import 'dart:async';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../Constants/ColorConstant.dart';
import '../../../Domain/Whisper/WhisperService.dart';

class VoiceQuestionScreen extends ConsumerStatefulWidget {
  const VoiceQuestionScreen({super.key});

  @override
  ConsumerState<VoiceQuestionScreen> createState() => _VoiceQuestionScreenState();
}

class _VoiceQuestionScreenState extends ConsumerState<VoiceQuestionScreen>
    with TickerProviderStateMixin {
  final SpeechToText _speechToText = SpeechToText();
  final TextEditingController _textController = TextEditingController();

  bool _isSpeechInitialized = false;
  bool _isListening = false;
  bool _isTranscribing = false;
  bool _isSubmitting = false;

  double _soundLevel = 0.0;
  String _selectedLanguage = 'hi_IN'; // 'hi_IN' (Hindi) or 'en_IN' (English)
  String _statusMessage = "Tap mic to speak";
  int _recordingSeconds = 0;
  Timer? _recordingTimer;
  String? _currentAudioPath;


  late AnimationController _pulseController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _initSpeechEngine();
  }

  void _initAnimations() {
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.reverse();
      } else if (status == AnimationStatus.dismissed && _isListening) {
        _pulseController.forward();
      }
    });

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  Future<void> _initSpeechEngine() async {
    try {
      bool available = await _speechToText.initialize(
        onError: _onSpeechError,
        onStatus: _onSpeechStatus,
        debugLogging: false,
      );

      if (mounted) {
        setState(() {
          _isSpeechInitialized = available;
        });
        if (available) {
          _startVoiceCapture();
        }
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isSpeechInitialized = false;
        });
      }
    }
  }

  void _onSpeechStatus(String status) {
    if (!mounted) return;
    if (status == 'listening') {
      setState(() {
        _isListening = true;
        _statusMessage = "Listening... Speak your question clearly";
      });
      _pulseController.forward();
    } else if (status == 'notListening' || status == 'done') {
      if (_isListening) {
        _stopVoiceCapture();
      }
    }
  }

  void _onSpeechError(SpeechRecognitionError error) {
    if (!mounted) return;
    setState(() {
      _isListening = false;
      _statusMessage = "Tap mic to speak again";
    });
    _pulseController.stop();
    _stopTimer();
  }

  void _startTimer() {
    _recordingSeconds = 0;
    _recordingTimer?.cancel();
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _recordingSeconds++;
        });
      }
    });
  }

  void _stopTimer() {
    _recordingTimer?.cancel();
    _recordingTimer = null;
  }

  String _formatDuration(int seconds) {
    int m = seconds ~/ 60;
    int s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  void _startVoiceCapture() async {
    final whisper = ref.read(whisperServiceProvider);

    try {
      // 1. Start Audio Recorder file capture
      if (await whisper.hasPermission()) {
        _currentAudioPath = await whisper.startRecording();
      }

      // 2. Start Live Recognition Preview
      if (!_isSpeechInitialized) {
        _isSpeechInitialized = await _speechToText.initialize();
      }

      setState(() {
        _isListening = true;
        _statusMessage = "Listening... Speak now";
      });
      _pulseController.forward();
      _startTimer();

      await _speechToText.listen(
        onResult: (result) {
          if (mounted) {
            setState(() {
              _textController.text = result.recognizedWords;
              _textController.selection = TextSelection.fromPosition(
                TextPosition(offset: _textController.text.length),
              );
            });
          }
        },
        localeId: _selectedLanguage,
        listenMode: ListenMode.dictation,
        onSoundLevelChange: (level) {
          if (mounted) {
            setState(() {
              _soundLevel = level;
            });
          }
        },
        cancelOnError: false,
        partialResults: true,
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _isListening = false;
          _statusMessage = "Tap mic to speak";
        });
        _stopTimer();
      }
    }
  }

  void _stopVoiceCapture() async {
    _stopTimer();
    final whisper = ref.read(whisperServiceProvider);

    if (mounted) {
      setState(() {
        _isListening = false;
        _isTranscribing = true;
        _statusMessage = "Processing transcription...";
      });
      _pulseController.stop();
    }

    try {
      await _speechToText.stop();
    } catch (_) {}

    try {
      final audioPath = await whisper.stopRecording() ?? _currentAudioPath;
      if (audioPath != null && _textController.text.trim().isEmpty) {
        // Transcribe with Whisper service if text is empty
        final text = await whisper.transcribe(
          filePath: audioPath,
          language: _selectedLanguage.startsWith('hi') ? 'hi' : 'en',
        );
        if (text.isNotEmpty && mounted) {
          setState(() {
            _textController.text = text;
          });
        }
      }
    } catch (_) {}

    if (mounted) {
      setState(() {
        _isTranscribing = false;
        _statusMessage = _textController.text.trim().isNotEmpty
            ? "Transcription ready. Edit or submit below."
            : "Tap mic to speak again.";
      });
    }
  }

  void _toggleVoiceCapture() {
    if (_isListening) {
      _stopVoiceCapture();
    } else {
      _startVoiceCapture();
    }
  }

  Future<void> _submitQuestion() async {
    final String question = _textController.text.trim();
    if (question.isEmpty) {
      Fluttertoast.showToast(msg: "Please speak or type your question first");
      return;
    }

    if (_isListening) {
      _stopVoiceCapture();
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final formData = FormData.fromMap({
        'question': question,
      });

      final response = await ref.read(dioProvider).post(
        ApiClient.submitEmployeeQuestion,
        data: formData,
      );

      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });

        String msg = "Question submitted successfully!";
        if (response.data is Map<String, dynamic> &&
            response.data['message'] != null) {
          msg = response.data['message'].toString();
        }
        Fluttertoast.showToast(msg: msg);
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
        Fluttertoast.showToast(msg: "Failed to submit: $e");
      }
    }
  }

  @override
  void dispose() {
    _stopTimer();
    _pulseController.dispose();
    _waveController.dispose();
    _textController.dispose();
    try {
      _speechToText.stop();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          "Voice Question",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: primaryColorDark,
        elevation: 0,
        actions: [
          if (_textController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, color: Colors.white),
              tooltip: "Clear Text",
              onPressed: () {
                setState(() {
                  _textController.clear();
                  _statusMessage = "Tap mic to speak";
                });
              },
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Language Selector Pills
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.translate_rounded,
                        size: 18, color: primaryColorDark),
                    const SizedBox(width: 8),
                    _buildLanguageChip("Hindi (हिंदी)", "hi_IN"),
                    const SizedBox(width: 6),
                    _buildLanguageChip("English (EN)", "en_IN"),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Animated Mic Hero Section
              Stack(
                alignment: Alignment.center,
                children: [
                  // Outer Pulsing Ripple Rings
                  if (_isListening) ...[
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(0.12),
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: Tween<double>(begin: 1.0, end: 1.45).animate(
                        CurvedAnimation(
                            parent: _pulseController, curve: Curves.easeOut),
                      ),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(0.08),
                        ),
                      ),
                    ),
                  ],

                  // Core Mic Button
                  GestureDetector(
                    onTap: _toggleVoiceCapture,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: _isListening
                              ? [const Color(0xFFEF4444), const Color(0xFFDC2626)]
                              : [primaryColor, primaryColorDark],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: (_isListening ? Colors.red : primaryColor)
                                .withOpacity(0.35),
                            blurRadius: 18,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          _isListening ? Icons.stop_rounded : Icons.mic_rounded,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Recording Duration / Status
              if (_isListening)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDuration(_recordingSeconds),
                      style: TextStyle(
                        fontSize: Adaptive.sp(14),
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 6),

              // Status message
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Adaptive.sp(11.5),
                  fontWeight: FontWeight.w600,
                  color: _isListening
                      ? primaryColorDark
                      : Colors.blueGrey.shade600,
                ),
              ),
              const SizedBox(height: 24),

              // Audio Wave Animation Bar when listening
              if (_isListening)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(12, (index) {
                      final heights = [10.0, 18.0, 28.0, 22.0, 36.0, 24.0, 16.0, 32.0, 20.0, 12.0, 26.0, 14.0];
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 200 + (index * 30)),
                        margin: const EdgeInsets.symmetric(horizontal: 2.5),
                        width: 4,
                        height: (_soundLevel > 0)
                            ? (heights[index] * (_soundLevel / 5)).clamp(6.0, 42.0)
                            : heights[index] * 0.5,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),

              // Transcription Result Box
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Question:",
                          style: TextStyle(
                            fontSize: Adaptive.sp(12),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        if (_isTranscribing)
                          const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: primaryColorDark,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _textController,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: Adaptive.sp(13),
                        color: const Color(0xFF1E293B),
                        height: 1.4,
                      ),
                      decoration: InputDecoration(
                        hintText: "Spoken words will appear here. You can also type or edit...",
                        hintStyle: TextStyle(
                          fontSize: Adaptive.sp(11.5),
                          color: Colors.blueGrey.shade300,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: primaryColorDark, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Submit Question Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColorDark,
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.send_rounded, size: 20),
                  label: Text(
                    _isSubmitting ? "Submitting..." : "Submit Question",
                    style: TextStyle(
                      fontSize: Adaptive.sp(14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _isSubmitting ? null : _submitQuestion,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageChip(String label, String localeId) {
    final bool isSelected = _selectedLanguage == localeId;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLanguage = localeId;
        });
        if (_isListening) {
          _stopVoiceCapture();
          Future.delayed(const Duration(milliseconds: 300), () {
            _startVoiceCapture();
          });
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? primaryColorDark : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: Adaptive.sp(10.5),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.blueGrey.shade700,
          ),
        ),
      ),
    );
  }
}
