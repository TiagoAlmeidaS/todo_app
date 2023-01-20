// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupControllerBase, Store {
  Computed<dynamic>? _$isValidRegisterComputed;

  @override
  dynamic get isValidRegister => (_$isValidRegisterComputed ??=
          Computed<dynamic>(() => super.isValidRegister,
              name: '_SignupControllerBase.isValidRegister'))
      .value;

  late final _$signupModelAtom =
      Atom(name: '_SignupControllerBase.signupModel', context: context);

  @override
  SignupModel? get signupModel {
    _$signupModelAtom.reportRead();
    return super.signupModel;
  }

  @override
  set signupModel(SignupModel? value) {
    _$signupModelAtom.reportWrite(value, super.signupModel, () {
      super.signupModel = value;
    });
  }

  late final _$signupOutputObservableAtom = Atom(
      name: '_SignupControllerBase.signupOutputObservable', context: context);

  @override
  ObservableFuture<Either<ProfileFailure, SignupOutput>>?
      get signupOutputObservable {
    _$signupOutputObservableAtom.reportRead();
    return super.signupOutputObservable;
  }

  @override
  set signupOutputObservable(
      ObservableFuture<Either<ProfileFailure, SignupOutput>>? value) {
    _$signupOutputObservableAtom
        .reportWrite(value, super.signupOutputObservable, () {
      super.signupOutputObservable = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignupControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwodIsValidAtom =
      Atom(name: '_SignupControllerBase.passwodIsValid', context: context);

  @override
  bool? get passwodIsValid {
    _$passwodIsValidAtom.reportRead();
    return super.passwodIsValid;
  }

  @override
  set passwodIsValid(bool? value) {
    _$passwodIsValidAtom.reportWrite(value, super.passwodIsValid, () {
      super.passwodIsValid = value;
    });
  }

  late final _$emailIsValidAtom =
      Atom(name: '_SignupControllerBase.emailIsValid', context: context);

  @override
  bool? get emailIsValid {
    _$emailIsValidAtom.reportRead();
    return super.emailIsValid;
  }

  @override
  set emailIsValid(bool? value) {
    _$emailIsValidAtom.reportWrite(value, super.emailIsValid, () {
      super.emailIsValid = value;
    });
  }

  late final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase', context: context);

  @override
  dynamic setName(String str) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setName');
    try {
      return super.setName(str);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage emailRulesOnChange(String? value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.emailRulesOnChange');
    try {
      return super.emailRulesOnChange(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage passwordRulesOnChange(String? value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.passwordRulesOnChange');
    try {
      return super.passwordRulesOnChange(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage confirmPasswordRulesOnChange(String? value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.confirmPasswordRulesOnChange');
    try {
      return super.confirmPasswordRulesOnChange(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signupModel: ${signupModel},
signupOutputObservable: ${signupOutputObservable},
password: ${password},
passwodIsValid: ${passwodIsValid},
emailIsValid: ${emailIsValid},
isValidRegister: ${isValidRegister}
    ''';
  }
}
