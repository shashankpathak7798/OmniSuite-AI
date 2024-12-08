import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/keys.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/view/pdf_analyzer_desktop_view.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/view/pdf_analyzer_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';

@RoutePage()
class PDFAnalyzerPage extends StatelessWidget {
  const PDFAnalyzerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      key: PdfAnalyzerPage().responsivePageKey,
      mobile: const PdfAnalyzerMobileView(),
      desktop: const PdfAnalyzerDesktopView(),
      tablet: const PdfAnalyzerDesktopView(),
    );
  }
}
