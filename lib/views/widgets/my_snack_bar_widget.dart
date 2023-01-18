import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class MySnackBarWidget extends SnackBar {
  const MySnackBarWidget({
    Key? key, 
    required Widget content,
    ShapeBorder? shape
  }) : super(
    key: key, 
    content: content, 
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 10),
    padding: const EdgeInsets.all(24),
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
    backgroundColor: AppColors.whiteColor,
    shape: shape,
    elevation: 10
  );
}