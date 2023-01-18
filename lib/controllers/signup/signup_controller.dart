import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

import '../../error/form_validation_error_message.dart';
part 'signup_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final FormValidationErrorMessage _formValidationErrorMessage = FormValidationErrorMessage();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool obscurePassword = true;

  @observable
  bool obscureConfirmPassword = true;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @action
  void toggleObscurePassword() => obscurePassword = !obscurePassword;

  @action
  void toggleObscureConfirmPassword() => obscureConfirmPassword = !obscureConfirmPassword;

  @computed
  bool get isEmailValid => EmailValidator.validate(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isConfirmPasswordValid => confirmPassword.isNotEmpty && confirmPassword == password;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && isConfirmPasswordValid;
}