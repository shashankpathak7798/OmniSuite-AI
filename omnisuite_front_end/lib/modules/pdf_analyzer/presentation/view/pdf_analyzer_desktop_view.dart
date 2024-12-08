import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class PdfAnalyzerDesktopView extends StatelessWidget {
  const PdfAnalyzerDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      body: Row(
        children: [
          Container(
            width: UIHelpers.screenWidth(context) * 0.3,
            decoration: BoxDecoration(
              color: OmniSuiteColors.primary.shade1,
            ),
          ),
        ],
      ),
    );
  }
}
