import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CategoryButtonWidget extends StatelessWidget {
  const CategoryButtonWidget({
    Key? key, 
    required this.id, 
    required this.name,
    required this.onPressed,
    required this.activeCategoryId, 
  }) : super(key: key);

  final String id;
  final String name;
  final void Function() onPressed;
  final String activeCategoryId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      child: Text(
        name, 
        style: TextStyle(
          color: activeCategoryId == id ? AppColors.whiteColor : AppColors.grayColor, 
          fontWeight: FontWeight.bold, 
          letterSpacing: 1
        )
      )
    );
  }
}