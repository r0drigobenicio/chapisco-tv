import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import 'package:chapisco_tv/views/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const String assetChapiscoTVLogo = 'assets/images/ChapiscoTV Logo.svg';
    const String assetGoogleLogo = 'assets/images/flat-color-icons_google.svg';

    final Widget chapiscoTVLogo = SvgPicture.asset(
      assetChapiscoTVLogo,
      semanticsLabel: 'Logo ChapiscoTV',
      height: 48
    );

    final Widget googleLogo = SvgPicture.asset(
      assetGoogleLogo,
      semanticsLabel: 'Logo Google',
      height: 24
    );

    return Scaffold(
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
          Center(
            child: SingleChildScrollView(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    chapiscoTVLogo,
                    const SizedBox(height: 48),
                    const Text(
                      'Olá, seja bem-vindo(a)!', style: TextStyle(
                        color: AppColors.whiteColor, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 20,
                        letterSpacing: 1
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Por favor, faça login para continuar', style: TextStyle(
                        color: AppColors.grayColor,
                        letterSpacing: 1
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
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
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 24, 
                                horizontal: 32
                              ), 
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none, 
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                          ),
                          const SizedBox(height: 16,),
                          TextFormField(
                            style: const TextStyle(
                              color: AppColors.whiteColor, 
                              fontSize: 14, 
                              letterSpacing: 1
                            ),
                            decoration: InputDecoration(
                              hintText: 'Senha', 
                              hintStyle: const TextStyle(
                                color: AppColors.grayColor, 
                                fontSize: 14,
                                letterSpacing: 1
                              ), 
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(right: 32),
                                child: Icon(
                                  PhosphorIcons.eye,
                                  color: AppColors.grayColor,
                                ),
                              ),
                              filled: true, 
                              fillColor: AppColors.inputBackgroundColor, 
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 24, 
                                horizontal: 32
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none, 
                                borderRadius: BorderRadius.circular(20),
                              )
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                ),
                                child: const Text(
                                  'Esqueceu sua senha?', 
                                  style: TextStyle(
                                    color: AppColors.grayColor, 
                                    fontWeight: FontWeight.bold, 
                                    letterSpacing: 1
                                  ),
                                )
                              )
                            ],
                          ),
                          const SizedBox(height: 48),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const HomePage()
                                    )
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    )
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Entrar', 
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold, 
                                      letterSpacing: 1
                                    ),
                                  ),
                                )
                              ),
                              const SizedBox(height: 16,),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    AppColors.whiteColor
                                  ), 
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    )
                                  ),
                                  overlayColor: MaterialStateProperty.all<Color>(
                                    AppColors.blackColor.withOpacity(0.2)
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      googleLogo,
                                      const SizedBox(width: 16),
                                      const Flexible(
                                        child: Text(
                                          'Entrar com o Google', 
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold, 
                                            letterSpacing: 1
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ),
                              const SizedBox(height: 24,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Não possui uma conta? ', 
                                    style: TextStyle(
                                      color: AppColors.whiteColor, 
                                      letterSpacing: 1
                                    )
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                    ),
                                    child: const Text(
                                      'Cadastre-se', 
                                      style: TextStyle(
                                        color: AppColors.primaryColor, 
                                        fontWeight: FontWeight.bold, 
                                        letterSpacing: 1
                                      ),
                                    )
                                  )
                                ],
                              )
                            ]
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}