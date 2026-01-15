import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/get_started_button.dart';
import 'package:omnisuite_front_end/modules/dashboard/presentation/widgets/neon_ai_loader_widget.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class FeatureCardWidget extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final String assetPath;

  const FeatureCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.assetPath,
  });

  @override
  State<FeatureCardWidget> createState() => _FeatureCardWidgetState();
}

class _FeatureCardWidgetState extends State<FeatureCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: OmniSuiteColors.cardColor,
        border: Border.all(color: OmniSuiteColors.borderGreen, width: 1),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: OmniSuiteColors.neonGreen.withOpacity(0.25),
            blurRadius: 40,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: OmniSuiteColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          UIHelpers.verticalSpaceTiny,
          Stack(
            children: [
              const NeonAiLoader(),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(widget.assetPath)
                ),
              ),
            ],
          ),
          UIHelpers.verticalSpace(24),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: OmniSuiteTextStyle.small.copyWith(
              color: OmniSuiteColors.textSecondary,
            ),
          ),
          UIHelpers.verticalSpaceMedium,
          GetStartedButton(
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
