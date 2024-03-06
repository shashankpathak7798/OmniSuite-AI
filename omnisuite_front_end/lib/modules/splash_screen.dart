import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/config/router/app_router.gr.dart';
import 'package:omnisuite_front_end/services/locator.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(
      seconds: 02,
    ), () {
      locator<AppRouter>().pushAndPopUntil(const LandingRoute(), predicate: (route) => route.data == null,);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: OmniSuiteColors.white,
              strokeCap: StrokeCap.round,
            ),
            SizedBox(height: 20),
            Text('Loading...', style: OmniSuiteTextStyle.normal,),
          ],
        ),
      ),
    );
  }
}