import 'package:flutter/material.dart';

class OmniSuiteColors {
  OmniSuiteColors._();

  static const OmniSuiteColor primary = OmniSuiteColor(
    _primaryValue,
    <int, Color>{
      0: Color(_primaryValue),
      1: Color(0xFF3A3B3C),
    }
  );

  static const int _primaryValue = 0xFF202124;

  static const OmniSuiteColor white = OmniSuiteColor(
    _whiteValue,
    <int, Color>{
      0: Color(_whiteValue),
    }
  );

  static const int _whiteValue = 0xFFFFFFFF;

  static Color hintColor = Colors.white.withOpacity(0.7);
  static Color transparent = Colors.transparent;


  static const bgBlack = Color(0xFF050707);
  static const neonGreen = Color(0xFF2EF2A3);
  static const neonGreenSoft = Color(0xFF1DBF84);
  static const neonGreenGlow = Color(0xFF3CFFB2);
  static const borderGreen = Color(0xFF2AAE7A);
  static const textGrey = Color(0xFF9AA6A0);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF050707),
      Color(0xFF020403),
    ],
  );

  static const LinearGradient cardBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2EF2A3),
      Color(0xFF1DBF84),
    ],
  );

  static const LinearGradient omniButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF3CFFB2), // highlight
      Color(0xFF1DBF84), // base
    ],
  );


  static const Color avatarBackground = Color(0xFF2979FF);
  static const Color textPrimary = Color(0xFFEDEDED);

  static const backgroundColor = Color(0xFF0B0B0F);
  static const cardColor = Color(0xFF111216);
  static const neonCyan = Color(0xFF00E5FF);
  static const textSecondary = Color(0xFF9CA3AF);

  static const neonGreen2 = Color(0xFF00E676);
  static const glowGreen = Color(0x6600E676);
  static const bgBlack2 = Color(0xFF000000);
}

class OmniSuiteColor extends ColorSwatch<int> {
  const OmniSuiteColor(super.primary, super.swatch);

  Color get shade1 => this[1]!;

  Color get shade2 => this[2]!;

  Color get shade3 => this[3]!;

  Color get shade4 => this[4]!;

  Color get shade5 => this[5]!;

  Color get shade6 => this[6]!;

  Color get shade7 => this[7]!;

  Color get shade8 => this[8]!;

  Color get shade9 => this[9]!;

}