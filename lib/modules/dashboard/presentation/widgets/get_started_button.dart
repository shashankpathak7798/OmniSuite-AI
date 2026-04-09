import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';

class GetStartedButton extends StatelessWidget {
  final void Function()? onTap;
  final bool? isComingSoon;

  const GetStartedButton({super.key, required this.onTap, this.isComingSoon});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: OmniSuiteColors.neonGreenGlow),
            boxShadow: [
              BoxShadow(
                color: OmniSuiteColors.neonGreenGlow.withOpacity(0.4),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                (isComingSoon ?? false) ? 'Coming Soon...' : 'Get Started',
                style: const TextStyle(
                  color: OmniSuiteColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (!(isComingSoon ?? false)) ...[
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward,
                    size: 16, color: OmniSuiteColors.textPrimary),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
