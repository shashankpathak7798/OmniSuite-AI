import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/keys.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/views/text_model_desktop_view.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/views/text_model_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';

@RoutePage()
class TextModelPage extends StatelessWidget {
  const TextModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      body: Responsive(key: AppKey().textModelPageKey.responsivePageKey, mobile: const TextModelMobileView(), tablet: TextModelDesktopView(), desktop: TextModelDesktopView(),),);
  }
}