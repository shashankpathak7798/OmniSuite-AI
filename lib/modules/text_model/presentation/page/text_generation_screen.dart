import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/keys.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/views/text_generation_desktop_view.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/views/text_generation_mobile_view.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';

class TextGenerationScreen extends StatelessWidget {
  const TextGenerationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      body: Responsive(key: AppKey().textModelPageKey.responsivePageKey, mobile: const TextGenerationMobileView(), tablet: TextGenerationDesktopView(), desktop: TextGenerationDesktopView(),),);
  }
}