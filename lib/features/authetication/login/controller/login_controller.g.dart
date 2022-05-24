// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_LoginControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_LoginControllerBase.email', context: context);

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
      Atom(name: '_LoginControllerBase.password', context: context);

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

  late final _$isPasswordVisibleAtom =
      Atom(name: '_LoginControllerBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$isPasswordConfirmationVisibleAtom = Atom(
      name: '_LoginControllerBase.isPasswordConfirmationVisible',
      context: context);

  @override
  bool get isPasswordConfirmationVisible {
    _$isPasswordConfirmationVisibleAtom.reportRead();
    return super.isPasswordConfirmationVisible;
  }

  @override
  set isPasswordConfirmationVisible(bool value) {
    _$isPasswordConfirmationVisibleAtom
        .reportWrite(value, super.isPasswordConfirmationVisible, () {
      super.isPasswordConfirmationVisible = value;
    });
  }

  late final _$singInAsyncAction =
      AsyncAction('_LoginControllerBase.singIn', context: context);

  @override
  Future<dynamic> singIn() {
    return _$singInAsyncAction.run(() => super.singIn());
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_LoginControllerBase.loginUser', context: context);

  @override
  Future<Resource<void, String>> loginUser() {
    return _$loginUserAsyncAction.run(() => super.loginUser());
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void setEmail(dynamic newValue) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(newValue);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setpassword(dynamic newValue) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setpassword');
    try {
      return super.setpassword(newValue);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordVisible() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPasswordVisible');
    try {
      return super.setPasswordVisible();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordConfirmationVisible() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPasswordConfirmationVisible');
    try {
      return super.setPasswordConfirmationVisible();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
email: ${email},
password: ${password},
isPasswordVisible: ${isPasswordVisible},
isPasswordConfirmationVisible: ${isPasswordConfirmationVisible}
    ''';
  }
}
