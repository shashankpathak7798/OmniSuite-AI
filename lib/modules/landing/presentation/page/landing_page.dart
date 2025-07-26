import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/keys.dart';
import 'package:omnisuite_front_end/modules/landing/presentation/views/landing_desktop_view.dart';
import 'package:omnisuite_front_end/modules/landing/presentation/views/landing_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(key: AppKey().landingPageKey.responsivePageKey, mobile: const LandingMobileView(), tablet: const LandingDesktopView(), desktop: const LandingDesktopView(),);
  }
}