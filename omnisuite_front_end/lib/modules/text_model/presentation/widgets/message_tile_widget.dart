import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class MessageTileWidget extends StatelessWidget {
  const MessageTileWidget({
    super.key,
    required this.profileImage,
    required this.prompt,
    required this.isBot,
  });

  final String profileImage;
  final String prompt;
  final bool isBot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UIHelpers.screenWidth(context) * 0.36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBot) ...[
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profileImage),
            ),
            UIHelpers.horizontalSpaceSmall,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: OmniSuiteColors.primary.shade1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  prompt,
                  style: OmniSuiteTextStyle.normal.copyWith(
                    color: OmniSuiteColors.white,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
          ] else ...[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: OmniSuiteColors.primary.shade1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  prompt,
                  style: OmniSuiteTextStyle.normal.copyWith(
                    color: OmniSuiteColors.white,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
            UIHelpers.horizontalSpaceSmall,
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profileImage),
            ),
          ],
        ],
      ),
    );
  }
}
