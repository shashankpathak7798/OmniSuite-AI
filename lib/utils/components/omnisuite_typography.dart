import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';

class OmniSuiteTextStyle {
  OmniSuiteTextStyle._();

  static const String _fontFamily = 'ubuntu';
  static const Color _fontColor = OmniSuiteColors.white;
  static final Color _fontHintColor = OmniSuiteColors.hintColor;
  static const FontWeight _fontWeight = FontWeight.normal;

  static const TextStyle headingH1 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 48.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.42,
    height: 32.0 / 28.0,
  );

  static const TextStyle headingH2 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 40.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.36,
    height: 32.0 / 24.0,
  );

  static const TextStyle subheadingH3 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 32.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.3,
    height: 26.0 / 20.0,
  );

  static const TextStyle subheadingH4 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
  );

  static const TextStyle subheadingH5 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 24.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.24,
    height: 21.0 / 16.0,
  );

  static const TextStyle subheadingH6 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 20.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 20.0 / 16.0,
  );

  static const TextStyle normal = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 18.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.24,
    height: 24.0 / 16.0,
  );

  static const TextStyle small = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  static final TextStyle hint = TextStyle(
    color: _fontHintColor,
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  static const TextStyle mediumHint = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
  );

  static const TextStyle smallHint = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 10.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  static const TextStyle regularTextStyle = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.4,
    height: 34.0 / 16.0,
  );
}