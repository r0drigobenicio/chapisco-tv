import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class MyElevatedButtonWidget extends StatelessWidget {
  const MyElevatedButtonWidget({
    Key? key, 
    this.onPressed, 
    required this.body, 
    this.backgroundColor, 
    required this.borderRadius, 
    this.isInfinity = true, 
    this.isDisabled = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget body;
  final Color? backgroundColor;
  final double borderRadius;
  final bool? isInfinity;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled! ? 0.5 : 1,
      child: (
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor,),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)
              )
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.blackColor.withOpacity(0.2)
            ),
          ),
          child: isInfinity == true 
            ? Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              alignment: Alignment.center,
              child: body
            ) 
            : Container(
              padding: const EdgeInsets.all(24),
              child: body
            )
        )
      ),
    );
  }
}