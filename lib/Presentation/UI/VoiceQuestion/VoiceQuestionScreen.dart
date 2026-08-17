import 'dart:async';
import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:emp_apnagodam/Presentation/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../Constants/ColorConstant.dart';

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
  double _soundLevel = 0.0;
  String _selectedLocaleId = 'en_IN';
  List<LocaleName> _availableLocales = [];
  String _statusMessage = "Tap mic to start speaking";

  late AnimationController _pulseController;
  late AnimationController _waveController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _initSpeech();
  }

  void _initAnimations() {
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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

  Future<void> _initSpeech() async {
    try {
      bool available = await _speechToText.initialize(
        onError: _onSpeechError,
        onStatus: _onSpeechStatus,
        debugLogging: false,
      );

      if (available) {
        var locales = await _speechToText.locales();
        if (mounted) {
          setState(() {
            _isSpeechInitialized = true;
            _availableLocales = locales;
            // Prefer Indian English or Hindi if available
            var preferred = locales.firstWhere(
              (l) => l.localeId == 'en_IN' || l.localeId == 'hi_IN',
              orElse: () => locales.isNotEmpty ? locales.first : LocaleName('en_US', 'English'),
            );
            _selectedLocaleId = preferred.localeId;
          });
          // Auto start listening immediately when entering this screen
          _startListening();
        }
      } else {
        setState(() {
          _isSpeechInitialized = false;
          _statusMessage = "Speech recognition unavailable. Type manually below.";
        });
      }
    } catch (e) {
      setState(() {
        _isSpeechInitialized = false;
        if (e.toString().contains("MissingPluginException")) {
          _statusMessage = "Please rebuild/restart the app to connect speech engine";
        } else {
          _statusMessage = "Speech service: $e";
        }
      });
    }
  }

  void _onSpeechStatus(String status) {
    if (!mounted) return;
    if (status == 'listening') {
      setState(() {
        _isListening = true;
        _statusMessage = "Listening... Speak now";
      });
      _pulseController.forward();
    } else if (status == 'notListening' || status == 'done') {
      setState(() {
        _isListening = false;
        _statusMessage = "Listening stopped. Tap mic to speak again";
      });
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  void _onSpeechError(SpeechRecognitionError error) {
    if (!mounted) return;
    setState(() {
      _isListening = false;
      _statusMessage = "Error: ${error.errorMsg}";
    });
    _pulseController.stop();
    _pulseController.reset();
  }

  void _startListening() async {
    if (!_isSpeechInitialized) {
      await _initSpeech();
    }

    if (!_isSpeechInitialized) {
      Fluttertoast.showToast(msg: "Microphone / Speech recognition not available");
      return;
    }

    try {
      setState(() {
        _isListening = true;
        _statusMessage = "Listening... Speak your question";
      });
      _pulseController.forward();

      await _speechToText.listen(
        onResult: _onSpeechResult,
        localeId: _selectedLocaleId,
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
      setState(() {
        _isListening = false;
        _statusMessage = "Failed to start listening: $e";
      });
    }
  }

  void _stopListening() async {
    try {
      await _speechToText.stop();
    } catch (_) {}
    if (mounted) {
      setState(() {
        _isListening = false;
        _statusMessage = "Tap mic to resume speaking";
      });
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (!mounted) return;
    setState(() {
      _textController.text = result.recognizedWords;
      _textController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textController.text.length),
      );
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    _textController.dispose();
    try {
      _speechToText.stop();
    } catch (_) {}
    super.dispose();
  }

  void _submitQuestion() async {
    String question = _textController.text.trim();
    if (question.isEmpty) {
      Fluttertoast.showToast(msg: "Please speak or write your question first");
      return;
    }

    if (_isListening) {
      _stopListening();
    }

    showLoaderDialog(context);
    try {
      var formData = FormData.fromMap({
        'question': question,
      });

      var response = await ref.read(dioProvider).post(
        ApiClient.submitEmployeeQuestion,
        data: formData,
      );

      hideLoaderDialog(context);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String msg = (response.data is Map && response.data['message'] != null)
            ? "${response.data['message']}"
            : "Question submitted successfully!";
        Fluttertoast.showToast(msg: msg);
        _textController.clear();
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        String msg = (response.data is Map && response.data['message'] != null)
            ? "${response.data['message']}"
            : "Failed to submit question";
        Fluttertoast.showToast(msg: msg);
      }
    } catch (e) {
      hideLoaderDialog(context);
      if (e is DioException) {
        String err = (e.response?.data is Map && e.response?.data['message'] != null)
            ? "${e.response?.data['message']}"
            : (e.message ?? "Error submitting question");
        Fluttertoast.showToast(msg: err);
      } else {
        Fluttertoast.showToast(msg: "Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        title: const Text("Voice Question / Assistant"),
        backgroundColor: primaryColorDark,
        elevation: 0,
        actions: [
          if (_availableLocales.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.language_rounded, color: Colors.white),
                tooltip: "Select Language",
                onSelected: (String localeId) {
                  setState(() {
                    _selectedLocaleId = localeId;
                  });
                  Fluttertoast.showToast(msg: "Language changed");
                },
                itemBuilder: (context) {
                  return _availableLocales.map((locale) {
                    return PopupMenuItem<String>(
                      value: locale.localeId,
                      child: Row(
                        children: [
                          Icon(
                            _selectedLocaleId == locale.localeId
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: _selectedLocaleId == locale.localeId ? primaryColorDark : Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              locale.name,
                              style: TextStyle(
                                fontWeight: _selectedLocaleId == locale.localeId
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header description card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColorDark.withOpacity(0.08),
                      primaryColor.withOpacity(0.04),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: primaryColorDark.withOpacity(0.15)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryColorDark.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.mic_none_rounded, color: primaryColorDark, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Speech-to-Text Question",
                            style: TextStyle(
                              fontSize: Adaptive.sp(13.5),
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "Tap the mic button and speak clearly. Your voice will automatically be converted to text.",
                            style: TextStyle(
                              fontSize: Adaptive.sp(11),
                              color: Colors.grey.shade700,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Animated Mic Visualizer
              _buildAnimatedMicSection(),

              const SizedBox(height: 14),

              // Status Pill
              Container(
                constraints: BoxConstraints(maxWidth: Adaptive.w(88)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: _isListening ? Colors.red.shade50 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _isListening ? Colors.red.shade200 : Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isListening ? Colors.red : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        _statusMessage,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Adaptive.sp(11.5),
                          fontWeight: FontWeight.w600,
                          color: _isListening ? Colors.red.shade700 : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Animated Sound Waves when recording
              if (_isListening) ...[
                const SizedBox(height: 16),
                _buildSoundWaves(),
              ],

              const SizedBox(height: 24),

              // Transcribed text box
              Container(
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
                  border: Border.all(
                    color: _isListening ? primaryColorDark.withOpacity(0.5) : Colors.grey.shade200,
                    width: _isListening ? 1.5 : 1,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 12, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.edit_note_rounded, color: primaryColorDark, size: 20),
                              const SizedBox(width: 6),
                              Text(
                                "Recognized Question",
                                style: TextStyle(
                                  fontSize: Adaptive.sp(12.5),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              if (_textController.text.isNotEmpty)
                                IconButton(
                                  tooltip: "Clear Text",
                                  icon: const Icon(Icons.clear_rounded, size: 20, color: Colors.grey),
                                  onPressed: () {
                                    setState(() {
                                      _textController.clear();
                                    });
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TextField(
                        controller: _textController,
                        maxLines: 6,
                        minLines: 4,
                        style: TextStyle(fontSize: Adaptive.sp(13), color: Colors.black87, height: 1.4),
                        decoration: InputDecoration(
                          hintText: _isListening
                              ? "Listening... spoken words will appear here in real time..."
                              : "Tap the microphone above and speak, or type your question here...",
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: Adaptive.sp(12)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        setState(() {
                          _textController.clear();
                          if (_isListening) _stopListening();
                        });
                      },
                      icon: const Icon(Icons.refresh_rounded, color: Colors.black87),
                      label: Text(
                        "Reset",
                        style: TextStyle(color: Colors.black87, fontSize: Adaptive.sp(13)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColorDark,
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _submitQuestion,
                      icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                      label: Text(
                        "Submit Question",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Adaptive.sp(13.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedMicSection() {
    return GestureDetector(
      onTap: _toggleListening,
      child: Center(
        child: SizedBox(
          width: 160,
          height: 160,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer wave 2
              if (_isListening)
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Container(
                      width: 150 * _pulseAnimation.value,
                      height: 150 * _pulseAnimation.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColorDark.withOpacity((1.3 - _pulseAnimation.value).clamp(0.05, 0.2)),
                      ),
                    );
                  },
                ),

              // Outer wave 1
              if (_isListening)
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Container(
                      width: 120 * _pulseAnimation.value,
                      height: 120 * _pulseAnimation.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColorDark.withOpacity((1.2 - _pulseAnimation.value).clamp(0.1, 0.35)),
                      ),
                    );
                  },
                ),

              // Main Circular Button
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: _isListening
                        ? [Colors.red.shade600, Colors.redAccent.shade700]
                        : [primaryColorDark, primaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _isListening
                          ? Colors.red.withOpacity(0.4)
                          : primaryColorDark.withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(
                  _isListening ? Icons.stop_rounded : Icons.mic_rounded,
                  color: Colors.white,
                  size: 42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSoundWaves() {
    return AnimatedBuilder(
      animation: _waveController,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(9, (index) {
            double height = 8 + (24 * (((index % 3) + 1) / 3) * (_waveController.value + 0.2));
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              width: 3.5,
              height: height.clamp(6.0, 32.0),
              decoration: BoxDecoration(
                color: primaryColorDark,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        );
      },
    );
  }
}
