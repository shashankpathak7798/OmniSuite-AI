import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/active_user_tile_widget.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/feature_card_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/orb_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/splash_header_widget.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/neon_loader.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class DashboardMobileView extends StatelessWidget {
  const DashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<DashboardBloc, DashboardState>(
            listener: (context, state) {
      if (state is DashboardFailureState) {
        context.go(AppLink.splash);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SplashHeaderWidget(
                        showTagline: false,
                        fontSize: 38,
                        onTap: () => context.go(AppLink.splash),
                      ),
                      if (state is DashboardSuccessState)
                        ActiveUserTileWidget(
                          emailId: state.emailId,
                        ),
                    ],
                  ),
                  UIHelpers.verticalSpaceMedium,
                  const Text(
                    "Your AI Workspace",
                    style: OmniSuiteTextStyle.subheadingH3,
                  ),
                  UIHelpers.verticalSpaceSmall,
                  Text(
                    "Text, PDFs, insights - all in one place",
                    style: OmniSuiteTextStyle.regularTextStyle.copyWith(
                      fontWeight: FontWeight.w300,
                      color: OmniSuiteColors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  UIHelpers.verticalSpaceMedium,
                  FeatureCardWidget(
                    assetPath: "assets/images/text-generation.png",
                    title: 'Text Generation',
                    description: "Create emails, blogs, and ideas instantly",
                    onTap: () {
                      context.go(AppLink.textGeneration);
                    },
                  ),
                  UIHelpers.verticalSpaceSmall,
                  FeatureCardWidget(
                    assetPath: "assets/images/pdf-analysis.png",
                    title: 'PDF Analyzer',
                    description: "Extract and summarize key information",
                    onTap: () {
                      // locator<AppRouter>().push(
                      //   const PDFAnalyzerRoute(),
                      // );
                    },
                  )
                ],
              ),
            ),
            if (state is DashboardLoadingState) ...[
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: UIHelpers.screenWidth(context),
                  height: UIHelpers.screenHeight(context),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: OmniSuiteColors.bgBlack.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: OmniSuiteColors.borderGreen, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: OmniSuiteColors.neonGreen.withOpacity(0.25),
                        blurRadius: 24,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: NeonLoader(),
                ),
              ),
            ],
          ],
        ),
      );
    }));
  }
}
