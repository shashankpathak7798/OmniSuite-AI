import 'dart:ui';

class AssetPaths {
  /// Shaders
  static const String _shaders = 'assets/shaders';
  static const String orbShader = '$_shaders/orb_shader.frag';
  static const String uiShader = '$_shaders/ui_glitch.frag';
}

typedef FragmentPrograms = ({FragmentProgram orb, FragmentProgram ui});

FragmentPrograms? fragmentPrograms;

Future<FragmentPrograms> loadFragmentPrograms() async {
  final fragPrograms = (
    orb: (await _loadFragmentProgram(AssetPaths.orbShader)),
    ui: (await _loadFragmentProgram(AssetPaths.uiShader)),
  );
  fragmentPrograms = fragPrograms;
  return fragPrograms;
}

Future<FragmentProgram> _loadFragmentProgram(String path) async {
  return (await FragmentProgram.fromAsset(path));
}
