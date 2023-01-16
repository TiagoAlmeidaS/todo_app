// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStoreBase, Store {
  late final _$customerNameAtom =
      Atom(name: '_ProfileStoreBase.customerName', context: context);

  @override
  String? get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String? value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  late final _$emailNameAtom =
      Atom(name: '_ProfileStoreBase.emailName', context: context);

  @override
  String? get emailName {
    _$emailNameAtom.reportRead();
    return super.emailName;
  }

  @override
  set emailName(String? value) {
    _$emailNameAtom.reportWrite(value, super.emailName, () {
      super.emailName = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_ProfileStoreBase.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  @override
  String toString() {
    return '''
customerName: ${customerName},
emailName: ${emailName},
token: ${token}
    ''';
  }
}
