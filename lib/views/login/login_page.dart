import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:page_transition/page_transition.dart';

import '../../controllers/login/login_controller.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_page.dart';
import '../recovery_password/recovery_password_page.dart';
import '../sign_up/sign_up_page.dart';
import '../widgets/my_elevated_button_widget.dart';
import '../widgets/my_input_widget.dart';
import '../widgets/my_scaffold_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    const String assetChapiscoTVLogo = 'assets/images/ChapiscoTV Logo.svg';
    const String assetGoogleLogo = 'assets/images/flat-color-icons_google.svg';

    final Widget chapiscoTVLogo = SvgPicture.asset(assetChapiscoTVLogo,
        semanticsLabel: 'Logo ChapiscoTV', height: 48);

    final Widget googleLogo = SvgPicture.asset(assetGoogleLogo,
        semanticsLabel: 'Logo Google', height: 24);

    return MyScaffoldWidget(
      children: Center(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              chapiscoTVLogo,
              const SizedBox(height: 48),
              const Text(
                'Olá, seja bem-vindo(a)!',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                'Por favor, faça login para continuar',
                style: TextStyle(
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Form(
                key: _formKey,
                child: Column(
                children: [
                  MyInputWidget(
                    hintText: 'Email',
                    borderRadius: 20,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _loginController.setEmail,
                    validator: (value) {
                      if (!_loginController.isEmailValid) {
                        return 'Endereço de email inválido. Exemplo de email válido: seunome@exemplo.com';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return MyInputWidget(
                        hintText: 'Senha',
                        obscureText: _loginController.obscurePassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: IconButton(
                            icon: Icon(
                              !_loginController.obscurePassword
                                  ? PhosphorIcons.eye_slash
                                  : PhosphorIcons.eye,
                              color: AppColors.grayColor,
                            ),
                            onPressed: () => _loginController.toggleObscurePassword(),
                          ),
                        ),
                        borderRadius: 20,
                        onChanged: _loginController.setPassword,
                        validator: (value) {
                          if (!_loginController.isPasswordValid) {
                            return 'A senha deve ter pelo menos 6 caracteres.';
                          }

                          return null;
                        },
                      );
                    }
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: const RecoveryPasswordPage(), 
                              childCurrent: widget, 
                              type: PageTransitionType.rightToLeftJoined, 
                              duration: const Duration(milliseconds: 600),
                              reverseDuration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut
                            )
                          );
                        },
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
                  Column(children: [
                    Observer(builder: (_) {
                      return MyElevatedButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushReplacement(
                              PageTransition(
                                child: const HomePage(), 
                                childCurrent: widget, 
                                type: PageTransitionType.rightToLeftJoined, 
                                duration: const Duration(milliseconds: 600),
                                reverseDuration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut
                              )
                            );
                          }
                        },
                        isDisabled: !_loginController.isFormValid,
                        body: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1
                          ),
                        ),
                        borderRadius: 20,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    MyElevatedButtonWidget(
                      onPressed: () {},
                      body: Row(
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
                      ),
                      borderRadius: 20,
                      backgroundColor: AppColors.whiteColor
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Não possui uma conta? ',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            letterSpacing: 1
                          )),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: const SignUpPage(), 
                                childCurrent: widget, 
                                type: PageTransitionType.rightToLeftJoined, 
                                duration: const Duration(milliseconds: 600),
                                reverseDuration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut
                              )
                            );
                          },
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
                ])
              ],
            )),
          ],
          ),
      ),
    ),
    );
  }
}
