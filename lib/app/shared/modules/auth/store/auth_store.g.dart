// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??=
          Computed<bool>(() => super.isLogged, name: '_AuthStoreBase.isLogged'))
      .value;
  Computed<String>? _$profileNavigateRouteComputed;

  @override
  String get profileNavigateRoute => (_$profileNavigateRouteComputed ??=
          Computed<String>(() => super.profileNavigateRoute,
              name: '_AuthStoreBase.profileNavigateRoute'))
      .value;

  late final _$customerIdAtom =
      Atom(name: '_AuthStoreBase.customerId', context: context);

  @override
  String get customerId {
    _$customerIdAtom.reportRead();
    return super.customerId;
  }

  @override
  set customerId(String value) {
    _$customerIdAtom.reportWrite(value, super.customerId, () {
      super.customerId = value;
    });
  }

  late final _$customerNameAtom =
      Atom(name: '_AuthStoreBase.customerName', context: context);

  @override
  String get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  late final _$customerEmailAtom =
      Atom(name: '_AuthStoreBase.customerEmail', context: context);

  @override
  String get customerEmail {
    _$customerEmailAtom.reportRead();
    return super.customerEmail;
  }

  @override
  set customerEmail(String value) {
    _$customerEmailAtom.reportWrite(value, super.customerEmail, () {
      super.customerEmail = value;
    });
  }

  late final _$tokenAtom = Atom(name: '_AuthStoreBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$isValidTokenAtom =
      Atom(name: '_AuthStoreBase.isValidToken', context: context);

  @override
  bool get isValidToken {
    _$isValidTokenAtom.reportRead();
    return super.isValidToken;
  }

  @override
  set isValidToken(bool value) {
    _$isValidTokenAtom.reportWrite(value, super.isValidToken, () {
      super.isValidToken = value;
    });
  }

  late final _$authSignInModelAtom =
      Atom(name: '_AuthStoreBase.authSignInModel', context: context);

  @override
  ObservableFuture<Either<AuthFailure, AuthSignInModel>?>? get authSignInModel {
    _$authSignInModelAtom.reportRead();
    return super.authSignInModel;
  }

  @override
  set authSignInModel(
      ObservableFuture<Either<AuthFailure, AuthSignInModel>?>? value) {
    _$authSignInModelAtom.reportWrite(value, super.authSignInModel, () {
      super.authSignInModel = value;
    });
  }

  late final _$authSignOutModelAtom =
      Atom(name: '_AuthStoreBase.authSignOutModel', context: context);

  @override
  ObservableFuture<Either<AuthFailure, AuthSignOutModel>?>?
      get authSignOutModel {
    _$authSignOutModelAtom.reportRead();
    return super.authSignOutModel;
  }

  @override
  set authSignOutModel(
      ObservableFuture<Either<AuthFailure, AuthSignOutModel>?>? value) {
    _$authSignOutModelAtom.reportWrite(value, super.authSignOutModel, () {
      super.authSignOutModel = value;
    });
  }

  late final _$authenticationObservableAtom =
      Atom(name: '_AuthStoreBase.authenticationObservable', context: context);

  @override
  ObservableFuture<Either<AuthFailure, AuthenticationOutput>?>?
      get authenticationObservable {
    _$authenticationObservableAtom.reportRead();
    return super.authenticationObservable;
  }

  @override
  set authenticationObservable(
      ObservableFuture<Either<AuthFailure, AuthenticationOutput>?>? value) {
    _$authenticationObservableAtom
        .reportWrite(value, super.authenticationObservable, () {
      super.authenticationObservable = value;
    });
  }

  late final _$initializerAsyncAction =
      AsyncAction('_AuthStoreBase.initializer', context: context);

  @override
  Future initializer() {
    return _$initializerAsyncAction.run(() => super.initializer());
  }

  late final _$fetchAuthSignInFromLocalAsyncAction =
      AsyncAction('_AuthStoreBase.fetchAuthSignInFromLocal', context: context);

  @override
  Future<dynamic> fetchAuthSignInFromLocal() {
    return _$fetchAuthSignInFromLocalAsyncAction
        .run(() => super.fetchAuthSignInFromLocal());
  }

  late final _$fetchAuthSignInAsyncAction =
      AsyncAction('_AuthStoreBase.fetchAuthSignIn', context: context);

  @override
  Future<dynamic> fetchAuthSignIn(
      {String? customerName,
      String? customerEmail,
      String? customerId,
      String? token}) {
    return _$fetchAuthSignInAsyncAction.run(() => super.fetchAuthSignIn(
        customerName: customerName,
        customerEmail: customerEmail,
        customerId: customerId,
        token: token));
  }

  late final _$fetchAuthSignOutAsyncAction =
      AsyncAction('_AuthStoreBase.fetchAuthSignOut', context: context);

  @override
  Future<dynamic> fetchAuthSignOut() {
    return _$fetchAuthSignOutAsyncAction.run(() => super.fetchAuthSignOut());
  }

  late final _$refreshTokenAsyncAction =
      AsyncAction('_AuthStoreBase.refreshToken', context: context);

  @override
  Future<String> refreshToken(AuthSignInModel authSignInModel) {
    return _$refreshTokenAsyncAction
        .run(() => super.refreshToken(authSignInModel));
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  dynamic setCustomerId(String? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setCustomerId');
    try {
      return super.setCustomerId(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerName(String? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setCustomerName');
    try {
      return super.setCustomerName(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCustomerEmail(String? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setCustomerEmail');
    try {
      return super.setCustomerEmail(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAccessToken(String? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setAccessToken');
    try {
      return super.setAccessToken(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customerId: ${customerId},
customerName: ${customerName},
customerEmail: ${customerEmail},
token: ${token},
isValidToken: ${isValidToken},
authSignInModel: ${authSignInModel},
authSignOutModel: ${authSignOutModel},
authenticationObservable: ${authenticationObservable},
isLogged: ${isLogged},
profileNavigateRoute: ${profileNavigateRoute}
    ''';
  }
}
