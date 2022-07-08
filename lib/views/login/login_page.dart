import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const String assetChapiscoTVLogo = 'assets/images/ChapiscoTV Logo.svg';

    final Widget chapiscoTVLogo = SvgPicture.asset(
      assetChapiscoTVLogo,
      semanticsLabel: 'ChapiscoTV Logo',
      height: 48
    );

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Gradient Background - Mobile.png'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                chapiscoTVLogo
              ],
            ),
          ),
        ),
      ),
    );
  }
}