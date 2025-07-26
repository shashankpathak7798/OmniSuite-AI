import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class UnderMaintenanceWidget extends StatelessWidget {
  const UnderMaintenanceWidget({
    super.key,
    this.headerView,
  });

  final Widget? headerView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 380),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (headerView != null) ...[headerView!, UIHelpers.verticalSpaceRegular,],
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.tealAccent.shade200,
                  Colors.tealAccent.shade700.withOpacity(0.3),
                  Colors.transparent,
                ],
                stops: [0.1, 0.8, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.tealAccent.withOpacity(0.2),
                  blurRadius: 14,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Feature Under Maintenance',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Responsive.isDesktop(context) ? 20 : 24,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Sorry, this feature is currently under maintenance.\nPlease check back soon!',
            style: TextStyle(
              color: Colors.white70,
              fontSize: Responsive.isDesktop(context) ? 15 : 18,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Responsive.isDesktop(context)
              ? SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.tealAccent),
                      foregroundColor: Colors.tealAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.6,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
