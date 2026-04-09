import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_event.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_state.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  const ChatMessage({required this.text, required this.isUser});
}

class PdfAnalyzerBloc extends Bloc<PdfAnalyzerEvent, PdfAnalyzerState> {
  static const String _baseUrl = 'http://127.0.0.1:5000';

  final TextEditingController questionController = TextEditingController();
  final List<ChatMessage> conversations = [];
  bool isPdfUploaded = false;
  List<String> uploadedFileNames = [];

  PdfAnalyzerBloc() : super(PdfAnalyzerInitialState()) {
    on<UploadPdfsEvent>(_onUploadPdfs);
    on<AskQuestionEvent>(_onAskQuestion);
    on<ResetPdfAnalyzerEvent>(_onReset);
  }

  FutureOr<void> _onUploadPdfs(
    UploadPdfsEvent event,
    Emitter<PdfAnalyzerState> emit,
  ) async {
    emit(PdfUploadingState());

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/process-pdfs'),
      );

      for (final file in event.files) {
        if (file.bytes != null) {
          request.files.add(http.MultipartFile.fromBytes(
            'pdf_files',
            file.bytes!,
            filename: file.name,
          ));
        }
      }

      final streamedResponse = await request.send().timeout(
            const Duration(seconds: 120),
          );
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        isPdfUploaded = true;
        uploadedFileNames = event.files.map((f) => f.name).toList();
        conversations.clear();
        emit(PdfUploadSuccessState());
      } else {
        emit(PdfUploadFailureState(
          message: 'Upload failed with status ${response.statusCode}',
        ));
      }
    } on TimeoutException {
      emit(PdfUploadFailureState(message: 'Upload timed out. Please try again.'));
    } catch (e) {
      emit(PdfUploadFailureState(message: 'Failed to connect to server.'));
    }
  }

  FutureOr<void> _onAskQuestion(
    AskQuestionEvent event,
    Emitter<PdfAnalyzerState> emit,
  ) async {
    conversations.add(ChatMessage(text: event.question, isUser: true));
    emit(PdfAskingState());

    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/ask-pdf'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'question': event.question}),
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final answer =
            data['answer'] ?? data['response'] ?? data.toString();
        conversations.add(ChatMessage(text: answer.toString(), isUser: false));
        emit(PdfAnswerSuccessState());
      } else {
        conversations.add(ChatMessage(
          text: 'Failed to get answer (status ${response.statusCode})',
          isUser: false,
        ));
        emit(PdfAnswerFailureState(message: 'Server returned ${response.statusCode}'));
      }
    } on TimeoutException {
      conversations.add(ChatMessage(
        text: 'Request timed out. Please try again.',
        isUser: false,
      ));
      emit(PdfAnswerFailureState(message: 'Request timed out.'));
    } catch (e) {
      conversations.add(ChatMessage(
        text: 'Failed to connect to server.',
        isUser: false,
      ));
      emit(PdfAnswerFailureState(message: 'Connection error.'));
    }
  }

  void _onReset(
    ResetPdfAnalyzerEvent event,
    Emitter<PdfAnalyzerState> emit,
  ) {
    isPdfUploaded = false;
    uploadedFileNames.clear();
    conversations.clear();
    questionController.clear();
    emit(PdfAnalyzerInitialState());
  }

  @override
  Future<void> close() {
    questionController.dispose();
    return super.close();
  }
}
