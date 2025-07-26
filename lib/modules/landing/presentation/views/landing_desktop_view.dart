import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/config/router/app_router.gr.dart';
import 'package:omnisuite_front_end/modules/landing/presentation/widgets/feature_card_widget.dart';
import 'package:omnisuite_front_end/modules/landing/presentation/widgets/header_widget.dart';
import 'package:omnisuite_front_end/services/locator.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class LandingDesktopView extends StatelessWidget {
  const LandingDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      body: Column(
        children: [
          UIHelpers.verticalSpaceLarge,
          const HeaderWidget(),
          UIHelpers.verticalSpaceSmall,
          Divider(
            color: OmniSuiteColors.primary.shade1,
            thickness: 1.5,
          ),
          UIHelpers.verticalSpaceTiny,
          Text(
            'Our Features',
            style: OmniSuiteTextStyle.normal.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
          UIHelpers.verticalSpaceTiny,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeatureCardWidget(
                backgroundGif: 'assets/gifs/text_model_background.gif',
                title: 'Text Generation AI',
                description: "Elevate Your Creativity",
                onTap: () {
                  locator<AppRouter>().push(
                    const TextModelRoute(),
                  );
                },
              ),
              FeatureCardWidget(
                backgroundGif: 'assets/gifs/text_model_background.gif',
                title: 'PDF Analyzer',
                description: "Unlock Insights, Seamlessly!",
                onTap: () {
                  locator<AppRouter>().push(
                    const PDFAnalyzerRoute(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
