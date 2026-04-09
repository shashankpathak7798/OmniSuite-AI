import 'package:file_picker/file_picker.dart';

abstract class PdfAnalyzerEvent {}

class UploadPdfsEvent extends PdfAnalyzerEvent {
  final List<PlatformFile> files;
  UploadPdfsEvent({required this.files});
}

class AskQuestionEvent extends PdfAnalyzerEvent {
  final String question;
  AskQuestionEvent({required this.question});
}

class ResetPdfAnalyzerEvent extends PdfAnalyzerEvent {}
