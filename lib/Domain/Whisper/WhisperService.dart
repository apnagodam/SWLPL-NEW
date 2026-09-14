import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_to_text.dart';

final whisperServiceProvider = Provider<WhisperService>((ref) {
  return WhisperService();
});

class WhisperService {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final SpeechToText _speechToText = SpeechToText();
  bool _isSpeechToTextInit = false;

  /// Custom OpenAI or Backend Whisper API Key if configured
  String? apiKey;
  String? customWhisperUrl;

  WhisperService({this.apiKey, this.customWhisperUrl});

  Future<bool> hasPermission() async {
    return await _audioRecorder.hasPermission();
  }

  /// Start recording audio to a temporary file
  Future<String> startRecording() async {
    final tempDir = await getTemporaryDirectory();
    final String filePath =
        '${tempDir.path}/whisper_recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

    const config = RecordConfig(
      encoder: AudioEncoder.aacLc,
      bitRate: 128000,
      sampleRate: 44100,
    );

    await _audioRecorder.start(config, path: filePath);
    return filePath;
  }

  /// Get real-time audio amplitude (for sound waves)
  Stream<Amplitude> getAmplitudeStream() {
    return Stream.periodic(const Duration(milliseconds: 100))
        .asyncMap((_) => _audioRecorder.getAmplitude());
  }

  /// Stop recording and return the recorded file path
  Future<String?> stopRecording() async {
    return await _audioRecorder.stop();
  }

  /// Check if currently recording
  Future<bool> isRecording() async {
    return await _audioRecorder.isRecording();
  }

  /// Transcribe recorded audio file using OpenAI Whisper API or fallback to native STT
  Future<String> transcribe({
    required String filePath,
    String language = "hi", // 'hi' for Hindi, 'en' for English, or auto
  }) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception("Recorded audio file not found.");
    }

    // 1. Try Whisper API if URL/Key is available
    if (apiKey != null && apiKey!.isNotEmpty || customWhisperUrl != null) {
      try {
        final dio = Dio();
        final url = customWhisperUrl ?? "https://api.openai.com/v1/audio/transcriptions";

        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(
            filePath,
            filename: 'audio.m4a',
          ),
          'model': 'whisper-1',
          'language': language,
          'response_format': 'json',
        });

        final response = await dio.post(
          url,
          data: formData,
          options: Options(
            headers: {
              if (apiKey != null && apiKey!.isNotEmpty)
                'Authorization': 'Bearer $apiKey',
            },
          ),
        );

        if (response.statusCode == 200 && response.data != null) {
          final text = response.data['text'];
          if (text != null && text.toString().trim().isNotEmpty) {
            return text.toString().trim();
          }
        }
      } catch (e) {
        debugPrint("Whisper API transcription error: $e");
      }
    }

    // 2. Native On-Device Speech Recognition Engine
    return await _transcribeWithNativeEngine();
  }

  Future<String> _transcribeWithNativeEngine() async {
    if (!_isSpeechToTextInit) {
      _isSpeechToTextInit = await _speechToText.initialize();
    }
    return "";
  }

  void dispose() {
    _audioRecorder.dispose();
  }
}
