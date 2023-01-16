// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WelcomeController on _WelcomeControllerBase, Store {
  late final _$isValidButtonAtom =
      Atom(name: '_WelcomeControllerBase.isValidButton', context: context);

  @override
  bool? get isValidButton {
    _$isValidButtonAtom.reportRead();
    return super.isValidButton;
  }

  @override
  set isValidButton(bool? value) {
    _$isValidButtonAtom.reportWrite(value, super.isValidButton, () {
      super.isValidButton = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_WelcomeControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$_WelcomeControllerBaseActionController =
      ActionController(name: '_WelcomeControllerBase', context: context);

  @override
  TodoTextInputMessage nameRulesOnChange(String? value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.nameRulesOnChange');
    try {
      return super.nameRulesOnChange(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage nameRulesOnLeave(String? value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.nameRulesOnLeave');
    try {
      return super.nameRulesOnLeave(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoTextInputMessage helperHint() {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.helperHint');
    try {
      return super.helperHint();
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveName() {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.saveName');
    try {
      return super.saveName();
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValidButton: ${isValidButton},
name: ${name}
    ''';
  }
}
