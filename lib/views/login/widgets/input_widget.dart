import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    Key? key, 
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor, 
    this.obscureText = false, 
    this.borderRadius = 0,
  }) : super(key: key);

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool obscureText;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return (
      TextFormField(
        style: const TextStyle(
          color: AppColors.whiteColor, 
          fontSize: 14, 
          letterSpacing: 1
        ),
        decoration: InputDecoration(
          hintText: hintText, 
          hintStyle: const TextStyle(
            color: AppColors.grayColor, 
            fontSize: 14,
            letterSpacing: 1
          ), 
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true, 
          fillColor: fillColor ?? AppColors.inputBackgroundColor, 
          contentPadding: const EdgeInsets.symmetric(
            vertical: 24, 
            horizontal: 24
          ), 
          border: OutlineInputBorder(
            borderSide: BorderSide.none, 
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        obscureText: obscureText,
      )
    );
  }
}