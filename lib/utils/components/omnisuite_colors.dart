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