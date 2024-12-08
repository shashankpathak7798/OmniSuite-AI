import 'package:flutter/material.dart';

class AppKey {
  LandingPage landingPageKey = LandingPage();
  TextModelPage textModelPageKey = TextModelPage();
  PdfAnalyzerPage pdfAnalyzerPage = PdfAnalyzerPage();
}

class LandingPage {
  Key responsivePageKey = UniqueKey();
}

class TextModelPage {
  Key responsivePageKey = UniqueKey();
}

class PdfAnalyzerPage {
  Key responsivePageKey = UniqueKey();
}
