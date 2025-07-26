import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key,
  required this.controller,
  this.labelText,
  this.hintText,
  this.enabled,
  this.keyboardType,
  this.validator,
  this.border,
  this.suffixIcon,
  this.contentPadding,
  this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? enabled;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: UIHelpers.screenWidth(context) * 0.2,),
      height: UIHelpers.screenHeight(context) * 0.07,
      child: TextFormField(
        controller: widget.controller,
        style: OmniSuiteTextStyle.normal.copyWith(
            color: OmniSuiteColors.white,
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText: widget.hintText ?? "What's Up?",
          hintStyle: OmniSuiteTextStyle.hint.copyWith(),
          border: widget.border ?? OutlineInputBorder(
            borderSide: BorderSide(
              color: OmniSuiteColors.hintColor,
              width: 1,
            ),
          ),
          enabledBorder: widget.border ?? OutlineInputBorder(
            borderSide: BorderSide(
              color: OmniSuiteColors.hintColor,
              width: 1,
            ),
          ),
          disabledBorder: widget.border ?? OutlineInputBorder(
            borderSide: BorderSide(
              color: OmniSuiteColors.hintColor,
              width: 1,
            ),
          ),
          focusedBorder: widget.border ?? OutlineInputBorder(
            borderSide: BorderSide(
              color: OmniSuiteColors.hintColor,
              width: 1,
            ),
          ),
          suffixIcon: widget.suffixIcon,
        ),

      ),
    );
  }
}