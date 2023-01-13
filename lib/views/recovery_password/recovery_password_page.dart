import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:page_transition/page_transition.dart';

import '../../controllers/login/login_controller.dart';
import '../../core/theme/app_colors.dart';
import '../login/login_page.dart';
import '../login/widgets/elevated_button_widget.dart';
import '../login/widgets/input_widget.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = LoginController();

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
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      icon: const Icon(PhosphorIcons.arrow_left)
                    ),
                  ),
                  title: const Text(
                    'Recuperar senha', 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5
                    )
                  ),
                  pinned: false,
                  snap: true,
                  floating: true,
                  backgroundColor: AppColors.backgroundColor.withOpacity(0.9),
                  elevation: 0,
                  expandedHeight: 56,
                  collapsedHeight: 56,
                  automaticallyImplyLeading: false,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16, 
                      horizontal: 24
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Digite o email associado à sua conta no campo abaixo.',
                            style: TextStyle(
                              color: AppColors.grayColor,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1
                            ),
                          ),
                          const SizedBox(height: 32),
                          InputWidget(
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
                          const SizedBox(height: 24),
                          Observer(builder: (_) {
                            return ElevatedButtonWidget(
                              onPressed: () {
                                if(_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(
                                    PageTransition(
                                      child: const LoginPage(), 
                                      childCurrent: widget, 
                                      type: PageTransitionType.rightToLeftJoined, 
                                      duration: const Duration(milliseconds: 600),
                                      reverseDuration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut
                                    )
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Row(
                                        children: [
                                          const Icon(
                                            PhosphorIcons.check_circle_fill,
                                            color: AppColors.greenColor,
                                            size: 32,
                                          ),
                                          const SizedBox(width: 16),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                              Text(
                                                'Solicitação enviada!',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
                                                  color: AppColors.blackColor
                                                ),
                                              ),
                                              SizedBox(height: 24),
                                              Text(
                                                'Uma mensagem de email contendo instruções para recuperação de senha foi enviado para você.',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  letterSpacing: 1,
                                                  height: 1.5,
                                                  color: AppColors.blackColor
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],),
                                          )
                                        ],),
                                      behavior: SnackBarBehavior.floating,
                                      duration: const Duration(seconds: 10),
                                      padding: const EdgeInsets.all(24),
                                      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                                      backgroundColor: AppColors.whiteColor,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      elevation: 10
                                    ),
                                  );
                                }
                              },
                              body: const Text(
                                'Recuperar senha',
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1
                                ),
                              ), 
                              borderRadius: 20,
                              isDisabled: !_loginController.isEmailValid,
                            );
                          })
                        ],
                      ),
                    )
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}