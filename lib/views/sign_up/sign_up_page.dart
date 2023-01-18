import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../../controllers/signup/signup_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../error/form_validation_error_message.dart';
import '../widgets/my_elevated_button_widget.dart';
import '../widgets/my_input_widget.dart';
import '../widgets/my_scaffold_widget.dart';
import '../widgets/my_sliver_app_bar_widget.dart';
import '../widgets/my_snack_bar_widget.dart';
import '../widgets/snack_bar_content_widget.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = SignUpController();
  final FormValidationErrorMessage _formValidationErrorMessage = FormValidationErrorMessage();

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
                'Cadastro', 
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
                        'Insira suas informações nos campos abaixo.',
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
                        onChanged: _signUpController.setEmail,
                        validator: (value) {
                          if (!_signUpController.isEmailValid) {
                            return _formValidationErrorMessage.invalidEmailMessage;
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      Observer(builder: (_) {
                        return MyInputWidget(
                          hintText: 'Senha',
                          obscureText: _signUpController.obscurePassword,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: IconButton(
                              icon: Icon(
                                !_signUpController.obscurePassword
                                    ? PhosphorIcons.eye_slash
                                    : PhosphorIcons.eye,
                                color: AppColors.grayColor,
                              ),
                              onPressed: () => _signUpController.toggleObscurePassword(),
                            ),
                          ),
                          borderRadius: 20,
                          onChanged: _signUpController.setPassword,
                          validator: (value) {
                            if (!_signUpController.isPasswordValid) {
                              return _formValidationErrorMessage.invalidPasswordMessage;
                            }

                            return null;
                          },
                        );
                      }),
                      const SizedBox(height: 16,),
                      Observer(builder: (_) {
                        return MyInputWidget(
                          hintText: 'Confirmar senha',
                          obscureText: _signUpController.obscureConfirmPassword,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: IconButton(
                              icon: Icon(
                                !_signUpController.obscureConfirmPassword
                                    ? PhosphorIcons.eye_slash
                                    : PhosphorIcons.eye,
                                color: AppColors.grayColor,
                              ),
                              onPressed: () => _signUpController.toggleObscureConfirmPassword(),
                            ),
                          ),
                          borderRadius: 20,
                          onChanged: _signUpController.setConfirmPassword,
                          validator: (value) {
                            if (!_signUpController.isConfirmPasswordValid) {
                              return _formValidationErrorMessage.invalidConfirmPasswordMessage;
                            }

                            return null;
                          },
                        );
                      }),
                      const SizedBox(height: 24),
                      Observer(builder: (_) {
                        return MyElevatedButtonWidget(
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              Navigator.of(context).pop();
                            }
                          },
                          body: const Text(
                            'Realizar cadastro',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1
                            ),
                          ), 
                          borderRadius: 20,
                          isDisabled: !_signUpController.isFormValid,
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