import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omnisuite_front_end/config/router/routes.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/widgets/sign_in_form_widget.dart';
import 'package:omnisuite_front_end/modules/sign_in/utils/sign_in_keys.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/widgets/splash_header_widget.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/neon_loader.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';
import 'package:omnisuite_front_end/utils/custom_snackbar_service.dart';

class SignInMobileView extends StatelessWidget {
  const SignInMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            context.go(
              AppLink.splash,
            );
            CustomSnackbarService.showCustomSnackBar(
                title: 'Sign-in successful!', context: context);
          } else if (state is SignInFailureState) {
            CustomSnackbarService.showCustomSnackBar(
                title: 'Failed to login! Try after sometime...', context: context);
          }
        },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SplashHeaderWidget(
                          key: SignInKeys.signInHeaderWidget,
                          onTap: () => context.go(AppLink.splash),
                        ),
                      ),
                    ],
                  ),
                  UIHelpers.verticalSpace(100),
                  const SingleChildScrollView(child: SignInFormWidget(),),
                ],
              ),
              if (state is SignInLoadingState) ...[
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
      }
    );
  }
}
