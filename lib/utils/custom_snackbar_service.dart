import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/styles.dart';

class CustomSnackbarService {
  static void showCustomSnackBar({required String title, required BuildContext context}) {
    final snackBar = SnackBar(
      width: 400,
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      showCloseIcon: true,
      content: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.black,
      shape: StadiumBorder(
        side: BorderSide(
          width: 2.0,
          color: AppColors.orbColors[0],
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
