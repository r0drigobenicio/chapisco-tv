import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../controllers/login/login_controller.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/my_scaffold_widget.dart';
import '../widgets/my_sliver_app_bar_widget.dart';
import '../widgets/my_elevated_button_widget.dart';
import '../widgets/my_input_widget.dart';
import '../widgets/my_snack_bar_widget.dart';
import '../widgets/snack_bar_content_widget.dart';

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
      MyScaffoldWidget(
        children: CustomScrollView(
          slivers: [
            const MySliverAppBarWidget(
              expandedHeight: 56,
              collapsedHeight: 56,
              pinned: true,
              title: Text(
                'Recuperar senha', 
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5
                )
              ),
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
                      const SizedBox(height: 24),
                      Observer(builder: (_) {
                        return MyElevatedButtonWidget(
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                MySnackBarWidget(
                                  content: const SnackBarContentWidget(
                                    title: 'Solicitação enviada!', 
                                    description: 'Uma mensagem de email contendo instruções para recuperação de senha foi enviado para você.',
                                    icon: PhosphorIcons.check_circle_fill,
                                    iconColor: AppColors.greenColor
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                )
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
      )
    );
  }
}