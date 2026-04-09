abstract class PdfAnalyzerState {}

class PdfAnalyzerInitialState extends PdfAnalyzerState {}

class PdfUploadingState extends PdfAnalyzerState {}

class PdfUploadSuccessState extends PdfAnalyzerState {}

class PdfUploadFailureState extends PdfAnalyzerState {
  final String message;
  PdfUploadFailureState({required this.message});
}

class PdfAskingState extends PdfAnalyzerState {}

class PdfAnswerSuccessState extends PdfAnalyzerState {}

class PdfAnswerFailureState extends PdfAnalyzerState {
  final String message;
  PdfAnswerFailureState({required this.message});
}
