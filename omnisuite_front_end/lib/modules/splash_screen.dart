import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/config/router/app_router.gr.dart';
import 'package:omnisuite_front_end/services/locator.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 03,
      ),
      () {
        locator<AppRouter>().push(
          const LandingRoute(),
          // predicate: (route) => route.data == null,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/gifs/omni-suite_logo.gif",
            ),
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
