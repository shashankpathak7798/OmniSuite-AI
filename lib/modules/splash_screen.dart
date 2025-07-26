import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/responsive.dart';
import 'package:omnisuite_front_end/utils/assets.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/orb_shader_config.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/orb_shader_widget.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/particle_overlay.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/shader_effect.dart' hide ShaderEffect;
import 'package:omnisuite_front_end/utils/comman_widgets/start_button.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/styles.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/ticking_builder.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';
import 'package:omnisuite_front_end/utils/components/under_maintenance_widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _orbEnergy = 10;
  double _minOrbEnergy = 0;
  final _orbKey = GlobalKey<OrbShaderWidgetState>();
  var _mousePos = Offset.zero;

  Color get _orbColor => AppColors.orbColors[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Responsive.isDesktop(context)
          ? Consumer<FragmentPrograms?>(
              builder: (context, fragmentPrograms, child) {
                if (fragmentPrograms == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 80.0,
                    top: 20.0,
                    right: 80.0,
                  ),
                  child: Stack(
                    children: [
                      /// Header View
                      Align(
                        alignment: Alignment.topLeft,
                        child: _headerView(fragmentPrograms),
                      ),

                      /// Orb Shader Widget
                      Positioned.fill(
                        child: OrbShaderWidget(
                          key: _orbKey,
                          mousePos: _mousePos,
                          minEnergy: _minOrbEnergy,
                          config: OrbShaderConfig(
                            ambientLightColor: _orbColor,
                            materialColor: _orbColor,
                            lightColor: _orbColor,
                          ),
                          onUpdate: (energy) => setState(() {
                            _orbEnergy = energy;
                          }),
                        ),
                      ),

                      /// Particle Field
                      Positioned.fill(
                        child: IgnorePointer(
                          child: ParticleOverlay(
                            color: _orbColor,
                            energy: _orbEnergy,
                          ),
                        ),
                      ),

                      /// Tagline
                      Align(
                        alignment: Alignment.bottomRight,
                        child: _buildTagLineWidget(),
                      ),

                      /// Start Button
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: _buildStartButton(),
                      ),

                      /// Sign In/Sign Up Buttons
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildHeaderButton(
                              text: "Sign In",
                              onPressed: () => showMaintenanceDialog(context),
                            ),
                            UIHelpers.horizontalSpaceSmallRegular,
                            _buildHeaderButton(
                              text: "Sign Up",
                              onPressed: () => showMaintenanceDialog(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: UnderMaintenanceWidget(
                headerView: _headerView(null),
              ),
            ),
    );
  }

  Widget _headerView(({FragmentProgram orb, FragmentProgram ui})? fragmentPrograms) {
    return fragmentPrograms != null
        ? TickingBuilder(
            builder: (context, time) => AnimatedSampler(
              (image, size, canvas) {
                const double overdrawPx = 30;
                final shader = fragmentPrograms.ui.fragmentShader();
                shader
                  ..setFloat(0, size.width)
                  ..setFloat(1, size.height)
                  ..setFloat(2, time)
                  ..setImageSampler(0, image);
                Rect rect = Rect.fromLTWH(-overdrawPx, -overdrawPx, size.width + overdrawPx, size.height + overdrawPx);
                canvas.drawRect(rect, Paint()..shader = shader);
              },
              child: Transform.translate(
                offset: const Offset(-(0.2 * .5), 0),
                child: Text(
                  "OmniSuite AI",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          )
        : Transform.translate(
            offset: const Offset(-(0.2 * .5), 0),
            child: Text(
              "OmniSuite AI",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          );
  }

  Widget _buildTagLineWidget() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: const Text(
        "Work Smarter, Not Harder—Welcome to OmniSuite AI",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontStyle: FontStyle.italic,
          shadows: [Shadow(blurRadius: 2, color: Colors.black54, offset: Offset(1, 1))],
        ),
      ),
    );
  }

  Widget _buildStartButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 80.0),
      child: StartBtn(
        onPressed: () => showMaintenanceDialog(context),
      ),
    );
  }

  Widget _buildHeaderButton({required String text, VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Future<void> showMaintenanceDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.black.withOpacity(0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Colors.white24, width: 1.5),
        ),
        child: const UnderMaintenanceWidget(),
      ),
    );
  }
}
