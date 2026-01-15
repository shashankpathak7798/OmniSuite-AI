import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/active_user_tile_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/orb_widget.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/splash_header_widget.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/particle_overlay.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/start_button.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/styles.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';
import 'package:omnisuite_front_end/utils/components/under_maintenance_widget.dart';
import 'package:provider/provider.dart';

class SplashMobileView extends StatelessWidget {
  const SplashMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FragmentPrograms?>(
        builder: (context, fragmentPrograms, child) {
      return Stack(
        children: [
          const Positioned.fill(
            child: OrbWidget(),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SplashHeaderWidget(),
                UIHelpers.verticalSpaceMedium,
                _startBtn(context),
              ],
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: ParticleOverlay(
                color: AppColors.orbColors[0],
                energy: 10,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 20.0,
              ),
              child: BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  return Row(
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
                  );
                }
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _startBtn(BuildContext context) {
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
