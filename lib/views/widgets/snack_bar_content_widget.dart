import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SnackBarContentWidget extends StatelessWidget {
  const SnackBarContentWidget({Key? key, this.icon, this.iconColor, required this.title, required this.description}) : super(key: key);

  final IconData? icon;
  final Color? iconColor;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return (
      Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 32,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: AppColors.blackColor
                ),
              ),
              const SizedBox(height: 24),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  letterSpacing: 1,
                  height: 1.5,
                  color: AppColors.blackColor
                ),
                textAlign: TextAlign.center,
              ),
            ],),
          )
        ],
      )
    );
  }
}