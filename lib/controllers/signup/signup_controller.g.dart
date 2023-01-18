// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpControllerBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignUpControllerBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignUpControllerBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isConfirmPasswordValidComputed;

  @override
  bool get isConfirmPasswordValid => (_$isConfirmPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmPasswordValid,
              name: '_SignUpControllerBase.isConfirmPasswordValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpControllerBase.isFormValid'))
          .value;

  late final _$emailAtom =
      Atom(name: '_SignUpControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignUpControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_SignUpControllerBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$obscurePasswordAtom =
      Atom(name: '_SignUpControllerBase.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$obscureConfirmPasswordAtom = Atom(
      name: '_SignUpControllerBase.obscureConfirmPassword', context: context);

  @override
  bool get obscureConfirmPassword {
    _$obscureConfirmPasswordAtom.reportRead();
    return super.obscureConfirmPassword;
  }

  @override
  set obscureConfirmPassword(bool value) {
    _$obscureConfirmPasswordAtom
        .reportWrite(value, super.obscureConfirmPassword, () {
      super.obscureConfirmPassword = value;
    });
  }

  late final _$_SignUpControllerBaseActionController =
      ActionController(name: '_SignUpControllerBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleObscurePassword() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.toggleObscurePassword');
    try {
      return super.toggleObscurePassword();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleObscureConfirmPassword() {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.toggleObscureConfirmPassword');
    try {
      return super.toggleObscureConfirmPassword();
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
obscurePassword: ${obscurePassword},
obscureConfirmPassword: ${obscureConfirmPassword},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isConfirmPasswordValid: ${isConfirmPasswordValid},
isFormValid: ${isFormValid}
    ''';
  }
}
