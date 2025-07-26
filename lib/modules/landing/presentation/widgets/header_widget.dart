import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: OmniSuiteColors.primary.shade1,
          backgroundImage:
              const AssetImage("assets/images/omni-suite_logo.png"),
        ),
        UIHelpers.horizontalSpaceSmall,
        Column(
          children: [
            Text(
              'OmniSuite AI',
              style: OmniSuiteTextStyle.headingH1.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Unveiling Future',
              style: OmniSuiteTextStyle.normal.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
