import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omnisuite_front_end/config/router/route_action.dart';
import 'package:omnisuite_front_end/config/router/router_extensions.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/active_user_tile_widget.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/feature_card_widget.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/header_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/orb_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/splash_header_widget.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/neon_loader.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class DashboardDesktopView extends StatelessWidget {
  const DashboardDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardFailureState) {
          context.go(AppLink.splash);
        }
      },
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelpers.verticalSpaceLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SplashHeaderWidget(
                        onTap: () => context.go(AppLink.splash),
                      ),
                      if (state is DashboardSuccessState)
                        ActiveUserTileWidget(
                          emailId: state.emailId,
                        ),
                    ],
                  ),
                  UIHelpers.verticalSpace(100),
                  Responsive.isDesktop(context) ? Row(children: [
                    _infoWidget(context),
                    _featureCards(context),
                  ],) :
                  Wrap(
                    children: [
                      _infoWidget(context),
                      _featureCards(context),
                    ],
                  ),
                  UIHelpers.verticalSpace(50),
                ],
              ),
            ),
            if (state is DashboardLoadingState) ...[
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: UIHelpers.screenWidth(context) * 0.8,
                  height: UIHelpers.screenHeight(context) * 0.8,
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
    });
  }

  Widget _infoWidget(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Your AI Workspace",
            style: OmniSuiteTextStyle.headingH1,
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
          UIHelpers.verticalSpaceSmall,
          // ConstrainedBox(constraints: BoxConstraints(maxHeight: UIHelpers.screenHeight(context) * 0.5), child: const OrbWidget(),),
        ],
      ),
    );
  }

  Widget _featureCards(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 16,
        children: [
          Expanded(
            child: FeatureCardWidget(
              assetPath: "assets/images/text-generation.png",
              title: 'Text Generation',
              description:
              "Create emails, blogs, and ideas instantly",
              onTap: () {
                context.go(AppLink.textGeneration);
              },
            ),
          ),
          Expanded(
            child: FeatureCardWidget(
              assetPath: "assets/images/pdf-analysis.png",
              title: 'PDF Analyzer',
              description: "Extract and summarize key information",
              onTap: () {
                // locator<AppRouter>().push(
                //   const PDFAnalyzerRoute(),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
