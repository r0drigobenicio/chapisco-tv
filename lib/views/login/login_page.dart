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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    chapiscoTVLogo,
                    const SizedBox(height: 48),
                    const Text(
                      'Olá, seja bem-vindo(a)!', style: TextStyle(
                        color: AppColors.whiteColor, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 20,
                        letterSpacing: 1
                      )
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Por favor, faça login para continuar', style: TextStyle(
                        color: AppColors.grayColor,
                        letterSpacing: 1
                      )
                    ),
                    const SizedBox(height: 48),
                    Form(child: Column(
                      children: [
                        TextField(
                          style: const TextStyle(
                            color: AppColors.whiteColor, 
                            fontSize: 14, 
                            letterSpacing: 1
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email', 
                            hintStyle: const TextStyle(
                              color: AppColors.grayColor, 
                              fontSize: 14,
                              letterSpacing: 1
                            ), 
                            filled: true, 
                            fillColor: AppColors.inputBackgroundColor, 
                            contentPadding: EdgeInsets.fromLTRB(32, 24, 32, 24), 
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none, 
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                        )
                      ],
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}