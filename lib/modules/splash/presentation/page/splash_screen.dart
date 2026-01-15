import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/views/splash_desktop_view.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/views/splash_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/services/injectible.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SplashBloc>()..add(CheckUserValidityAndGetDetailsEvent()),
      child: Responsive(
        key: UniqueKey(),
        mobile: const SplashMobileView(),
        tablet: const SplashDesktopView(),
        desktop: const SplashDesktopView(),
      ),
    );
  }
}
