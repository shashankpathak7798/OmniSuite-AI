import 'dart:ui';

class AssetPaths {
  /// Shaders
  static const String _shaders = 'assets/shaders';
  static const String orbShader = '$_shaders/orb_shader.frag';
  static const String uiShader = '$_shaders/ui_glitch.frag';
}

typedef FragmentPrograms = ({FragmentProgram orb, FragmentProgram ui});

Future<FragmentPrograms> loadFragmentPrograms() async => (
      orb: (await _loadFragmentProgram(AssetPaths.orbShader)),
      ui: (await _loadFragmentProgram(AssetPaths.uiShader)),
    );

Future<FragmentProgram> _loadFragmentProgram(String path) async {
  return (await FragmentProgram.fromAsset(path));
}
