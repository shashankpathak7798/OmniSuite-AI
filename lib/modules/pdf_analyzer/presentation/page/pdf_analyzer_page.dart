import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/config/keys.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/bloc/pdf_analyzer_bloc.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/view/pdf_analyzer_desktop_view.dart';
import 'package:omnisuite_front_end/modules/pdf_analyzer/presentation/view/pdf_analyzer_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/services/injectible.dart';

class PDFAnalyzerPage extends StatelessWidget {
  const PDFAnalyzerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<PdfAnalyzerBloc>(),
      child: Responsive(
        key: PdfAnalyzerPage().responsivePageKey,
        mobile: const PdfAnalyzerMobileView(),
        desktop: const PdfAnalyzerDesktopView(),
        tablet: const PdfAnalyzerDesktopView(),
      ),
    );
  }
}
