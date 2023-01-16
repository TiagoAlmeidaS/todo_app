// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninController on _SigninControllerBase, Store {
  Computed<dynamic>? _$isValidButtonComputed;

  @override
  dynamic get isValidButton =>
      (_$isValidButtonComputed ??= Computed<dynamic>(() => super.isValidButton,
              name: '_SigninControllerBase.isValidButton'))
          .value;

  late final _$signOutputObservableAtom = Atom(
      name: '_SigninControllerBase.signOutputObservable', context: context);

  @override
  ObservableFuture<Either<ProfileFailure, SigninOutput>>?
      get signOutputObservable {
    _$signOutputObservableAtom.reportRead();
    return super.signOutputObservable;
  }

  @override
  set signOutputObservable(
      ObservableFuture<Either<ProfileFailure, SigninOutput>>? value) {
    _$signOutputObservableAtom.reportWrite(value, super.signOutputObservable,
        () {
      super.signOutputObservable = value;
    });
  }

  late final _$isValidEmailAtom =
      Atom(name: '_SigninControllerBase.isValidEmail', context: context);

  @override
  bool get isValidEmail {
    _$isValidEmailAtom.reportRead();
    return super.isValidEmail;
  }

  @override
  set isValidEmail(bool value) {
    _$isValidEmailAtom.reportWrite(value, super.isValidEmail, () {
      super.isValidEmail = value;
    });
  }

  late final _$isValidPasswordAtom =
      Atom(name: '_SigninControllerBase.isValidPassword', context: context);

  @override
  bool get isValidPassword {
    _$isValidPasswordAtom.reportRead();
    return super.isValidPassword;
  }

  @override
  set isValidPassword(bool value) {
    _$isValidPasswordAtom.reportWrite(value, super.isValidPassword, () {
      super.isValidPassword = value;
    });
  }

  late final _$signinModelAtom =
      Atom(name: '_SigninControllerBase.signinModel', context: context);

  @override
  SigninModel get signinModel {
    _$signinModelAtom.reportRead();
    return super.signinModel;
  }

  @override
  set signinModel(SigninModel value) {
    _$signinModelAtom.reportWrite(value, super.signinModel, () {
      super.signinModel = value;
    });
  }

  late final _$_SigninControllerBaseActionController =
      ActionController(name: '_SigninControllerBase', context: context);

  @override
  TodoTextInputMessage emailRulesOnChange(String? value) {
    final _$actionInfo = _$_SigninControllerBaseActionController.startAction(
        name: '_SigninControllerBase.emailRulesOnChange');
    try {
      return super.emailRulesOnChange(value);
    } finally {
      _$_SigninControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage passwordRulesOnChange(String? value) {
    final _$actionInfo = _$_SigninControllerBaseActionController.startAction(
        name: '_SigninControllerBase.passwordRulesOnChange');
    try {
      return super.passwordRulesOnChange(value);
    } finally {
      _$_SigninControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signOutputObservable: ${signOutputObservable},
isValidEmail: ${isValidEmail},
isValidPassword: ${isValidPassword},
signinModel: ${signinModel},
isValidButton: ${isValidButton}
    ''';
  }
}
