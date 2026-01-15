import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/orb_shader_config.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/orb_shader_widget.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/styles.dart';

class OrbWidget extends StatefulWidget {
  const OrbWidget({super.key});

  @override
  State<OrbWidget> createState() => _OrbWidgetState();
}

class _OrbWidgetState extends State<OrbWidget> {
  final double _minOrbEnergy = 0;

  final _orbKey = GlobalKey<OrbShaderWidgetState>();

  final _mousePos = Offset.zero;

  Color get _orbColor => AppColors.orbColors[0];

  @override
  Widget build(BuildContext context) {
    return OrbShaderWidget(
      key: _orbKey,
      mousePos: _mousePos,
      minEnergy: _minOrbEnergy,
      config: OrbShaderConfig(
        ambientLightColor: _orbColor,
        materialColor: _orbColor,
        lightColor: _orbColor,
      ),
      onUpdate: (energy) => setState(() {}),
    );
  }
}
