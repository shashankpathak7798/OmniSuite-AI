import 'package:flutter/material.dart';

class UIHelpers {

  static Widget horizontalSpaceTiny = const SizedBox(width: 5.0);
  static Widget horizontalSpaceSmall = const SizedBox(width: 10.0);
  static Widget horizontalSpaceRegular = const SizedBox(width: 15.0);
  static Widget horizontalSpaceSmallRegular = const SizedBox(width: 20.0);
  static Widget horizontalSpaceMedium = const SizedBox(width: 30.0);
  static Widget horizontalSpaceLarge = const SizedBox(width: 35.0);
 
  static Widget verticalSpaceTiny = const SizedBox(height: 5.0);
  static Widget verticalSpaceSmall = const SizedBox(height: 10.0);
  static Widget verticalSpaceRegular = const SizedBox(height: 15.0);
  static Widget verticalSpaceMedium = const SizedBox(height: 20.0);
  static Widget verticalSpaceLarge = const SizedBox(height: 35.0);
  static Widget verticalSpaceHuge = const SizedBox(height: 300.0);

  // Screen Size Helpers
  static double screenHeight(BuildContext context,) =>
      MediaQuery.of(context).size.height;

      static double screenWidth(BuildContext context,) =>
      MediaQuery.of(context).size.width;

      static double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
      MediaQuery.of(context).size.height * percentage;

      static double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
      MediaQuery.of(context).size.width * percentage;
}