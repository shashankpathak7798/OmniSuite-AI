import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/widgets/custom_text_form_field.dart';
import 'package:omnisuite_front_end/modules/sign_in/utils/sign_in_keys.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/styles.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';
import 'package:omnisuite_front_end/utils/string_extensions.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, Responsive.isDesktop(context) ? 60.0 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: OmniSuiteColors.bgBlack.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: OmniSuiteColors.borderGreen, width: 1),
          boxShadow: [
            BoxShadow(
              color: OmniSuiteColors.neonGreen.withOpacity(0.25),
              blurRadius: 24,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
          child: Form(
            key: BlocProvider.of<SignInBloc>(context).formKey,
            child: Column(
              children: [
                Text(
                  key: SignInKeys.signInWelcomeBackText,
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.orbColors[0],
                  ),
                ),
                UIHelpers.verticalSpaceRegular,
                CustomTextFormField(
                  key: SignInKeys.signInUsernameField,
                  controller:
                      BlocProvider.of<SignInBloc>(context).emailController,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.orbColors[0],
                  ),
                  validator: (value) {
                    if (value == null || value == '') {
                      return '*Required';
                    }

                    if (!value.validateUserName()) {
                      return 'Please provide an valid username/email!';
                    }

                    return null;
                  },
                  hintText: 'Username/Email',
                ),
                UIHelpers.verticalSpaceSmall,
                CustomTextFormField(
                  key: SignInKeys.signInPasswordField,
                  controller:
                      BlocProvider.of<SignInBloc>(context).passwordController,
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.orbColors[0],
                  ),
                  obscureText:
                      BlocProvider.of<SignInBloc>(context).obscurePassword,
                  validator: (value) {
                    if (value == null || value == '') {
                      return '*Required';
                    }

                    if (value.length < 6) {
                      return 'Password should be atleast 6 characters long';
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: () => BlocProvider.of<SignInBloc>(context)
                        .add(TogglePasswordVisibilityEvent()),
                    child: Icon(
                      key: SignInKeys.signInPasswordFieldIcon,
                      BlocProvider.of<SignInBloc>(context).obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.orbColors[0],
                    ),
                  ),
                ),
                UIHelpers.verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => BlocProvider.of<SignInBloc>(context)
                          .add(SignInUserEvent()),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        // BORDER THICKNESS
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3CFFB2),
                              Color(0xFF1DBF84),
                            ],
                          ),
                          boxShadow: [
                            // OUTER NEON GLOW
                            BoxShadow(
                              color: Color(0xFF2EF2A3).withOpacity(0.8),
                              blurRadius: 24,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF071B14),
                            // DARK GLASS FILL
                            boxShadow: [
                              // INNER DEPTH
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 34.0, vertical: 8.0),
                          child: Center(
                            child: Text(
                              key: SignInKeys.signInText,
                              'Sign In',
                              style: TextStyle(
                                  color: AppColors.orbColors[0],
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelpers.verticalSpaceSmall,
                if (Responsive.isDesktop(context)) _buildTagLineWidget(),
              ],
            ),
          ),
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
}
