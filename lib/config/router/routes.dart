import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/page/dashboard_screen.dart';
import 'package:omnisuite_front_end/modules/sign_in/presentation/pages/sign_in_page.dart';
import 'package:omnisuite_front_end/modules/splash/presentation/page/splash_screen.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/page/text_generation_screen.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';

class AppLink {
  static const String splash = '/';
  static const String signIn = '/sign-in';
  static const String dashboard = '/dashboard';
  static const String textGeneration = '/text-generation';
  // Add more routes as needed

  static List<String> get allPaths => [
        splash,
        signIn,
    dashboard,
    textGeneration,
        // Add more paths as needed
      ];

  static Widget getScreen(String? path) {
    Widget child;
    switch (path) {
      case splash:
        child = const SplashScreen();
      case signIn:
        child = const SignInPage();
      case dashboard:
        child = const DashboardScreen();
      case textGeneration:
        child = const TextGenerationScreen();
      // Add more cases for other paths
      default:
        child = const SplashScreen(); // Default screen if path not found
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: OmniSuiteColors.backgroundGradient,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/backgrounds/circuit_bg.svg',
                fit: BoxFit.cover,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
