import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omnisuite_front_end/config/router/route_action.dart';
import 'package:omnisuite_front_end/config/router/router_extensions.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/active_user_tile_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/orb_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/splash_header_widget.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/neon_loader.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/start_button.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';
import 'package:omnisuite_front_end/utils/components/under_maintenance_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SplashDesktopView extends StatefulWidget {
  const SplashDesktopView({super.key});

  @override
  State<SplashDesktopView> createState() => _SplashDesktopViewState();
}

class _SplashDesktopViewState extends State<SplashDesktopView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 80.0,
          top: 20.0,
          right: 80.0,
        ),
        child: Stack(
          children: [
            /// Header View
            const Align(
              alignment: Alignment.topLeft,
              child: SplashHeaderWidget(),
            ),

            /// Orb Shader Widget
            const OrbWidget(),

            /// Particle Field
            // Positioned.fill(
            //   child: IgnorePointer(
            //     child: ParticleOverlay(
            //       color: _orbColor,
            //       energy: 10,
            //     ),
            //   ),
            // ),

            /// Tagline
            Align(
              alignment: Alignment.bottomRight,
              child: Visibility(
                visible: Responsive.isDesktop(context),
                child: _buildTagLineWidget(),
              ),
            ),

            /// Start Button
            Align(
              alignment: Responsive.isTablet(context)
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              child: _buildStartButton(context),
            ),

            /// Sign In/Sign Up Buttons
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state is SplashSuccessState) ...[
                    ActiveUserTileWidget(
                      emailId: state.emailId,
                    ),
                  ] else ...[
                    _buildHeaderButton(
                      text: "Sign In",
                      onPressed: () => context.go(AppLink.signIn),
                    ),
                    UIHelpers.horizontalSpaceSmallRegular,
                    _buildHeaderButton(
                      text: "Sign Up",
                      onPressed: () => showMaintenanceDialog(context),
                    ),
                  ],
                ],
              ),
            ),

            if (state is SplashLoadingState) ...[
              const Positioned.fill(
                child: SizedBox(),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: UIHelpers.screenWidth(context) * 0.5,
                  height: UIHelpers.screenHeight(context) * 0.5,
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

  Widget _buildTagLineWidget() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: const Text(
        "Work Smarter, Not Harder—Welcome to OmniSuite AI",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(blurRadius: 2, color: Colors.black54, offset: Offset(1, 1))
          ],
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      if (state is SplashSuccessState) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: 20.0, left: Responsive.isTablet(context) ? 30.0 : 80.0),
          child: StartBtn(
            onPressed: () => context.go(AppLink.dashboard),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }

  Widget _buildHeaderButton({required String text, VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Future<void> showMaintenanceDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.black.withOpacity(0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Colors.white24, width: 1.5),
        ),
        child: const UnderMaintenanceWidget(),
      ),
    );
  }
}
