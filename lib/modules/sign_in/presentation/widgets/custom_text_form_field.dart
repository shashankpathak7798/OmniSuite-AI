import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
  });

  final bool? obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hint: Text(
          /// [TODO] Add key
          // key: ,
          hintText,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.white54,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.white54,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.white54,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
