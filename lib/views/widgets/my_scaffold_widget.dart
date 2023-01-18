import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class MyScaffoldWidget extends StatelessWidget {
  const MyScaffoldWidget({
    Key? key, 
    required this.children, 
    this.bottomNavigationBar
  }) : super(key: key);

  final Widget children;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Gradient Background - Mobile.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
            SafeArea(child: children)
          ],
        ),
        bottomNavigationBar: bottomNavigationBar,
      )
    );
  }
}