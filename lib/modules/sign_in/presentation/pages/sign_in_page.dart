import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/views/sign_in_desktop_view.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/views/sign_in_mobile_view.dart';
import 'package:omnisuite_front_end/modules/sign_in/utils/sign_in_keys.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/services/injectible.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<SignInBloc>(),
        ),
        // FutureProvider<FragmentPrograms?>(
        //   create: (context) => loadFragmentPrograms(),
        //   initialData: null,
        //   // builder: (context, snapshot) =>
        // ),
      ],
      child: Responsive(
        key: SignInKeys.signInResponsive,
        desktop: SignInDesktopView(
          key: SignInKeys.signInDesktopView,
        ),
        mobile: SignInMobileView(
          key: SignInKeys.signInMobileView,
        ),
        tablet: SignInDesktopView(
          key: SignInKeys.signInDesktopView,
        ),
      ),
    );
  }
}
