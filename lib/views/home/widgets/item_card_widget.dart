import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    Key? key, 
    required this.id, 
    required this.image, 
    required this.onTap,
    required this.activeElementId,
  }) : super(key: key);

  final String id;
  final String image;
  final Function() onTap;
  final String activeElementId;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: activeElementId == id ? AppColors.whiteColor : Colors.transparent
        )
      ),
      elevation: 5,
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Ink.image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: onTap
          ),
        ),
      ),
    );
  }
}