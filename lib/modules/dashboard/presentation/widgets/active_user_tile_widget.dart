import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class ActiveUserTileWidget extends StatelessWidget {
  const ActiveUserTileWidget({super.key, this.emailId});

  final String? emailId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: OmniSuiteColors.bgBlack.withOpacity(0.85),
        borderRadius:
            Responsive.isDesktop(context) ? BorderRadius.circular(16) : null,
        shape: !Responsive.isDesktop(context)
            ? BoxShape.circle
            : BoxShape.rectangle,
        border: Border.all(color: OmniSuiteColors.borderGreen, width: 1),
        boxShadow: [
          BoxShadow(
            color: OmniSuiteColors.neonGreen.withOpacity(0.25),
            blurRadius: 24,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Tooltip(
            message: emailId,
            triggerMode: TooltipTriggerMode.tap,
            child: CircleAvatar(
              backgroundColor: OmniSuiteColors.avatarBackground,
              child: Text(
                emailId?.characters.first ?? 'A',
                style: const TextStyle(
                  color: OmniSuiteColors.textPrimary,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (Responsive.isDesktop(context)) ...[
            UIHelpers.horizontalSpaceSmall,
            Text(
              emailId ?? '',
              style: const TextStyle(
                color: OmniSuiteColors.textPrimary,
                fontSize: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
