import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/custom_navigation_bar/routers/custom_navigation_router.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';
import 'package:todo_app/app/shared/modules/auth/errors/auth_failure.dart';
import 'package:todo_app/app/shared/modules/auth/models/authentication_model.dart';

import '../../../services/local_storage/local_storage_service.dart';
import '../models/auth_signin_model.dart';
import '../models/auth_signout_model.dart';
import '../repositories/auth_local_repository.dart';
import '../repositories/auth_repository.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LocalStorageService _localStorageService;
  final AuthLocalRepository _authLocalRepository;
  final AuthRepository authRepository;

  _AuthStoreBase(this._localStorageService, this._authLocalRepository,
      this.authRepository);

  @action
  initializer() async {
    await fetchAuthSignInFromLocal();
  }

  @observable
  String customerId = "";

  setCustomerId(String? value) {
    customerId = value ?? "";
  }

  @observable
  String customerName = "";

  setCustomerName(String? value) {
    customerName = value ?? "";
  }

  @observable
  String customerEmail = "";

  setCustomerEmail(String? value) {
    customerEmail = value ?? "";
  }

  @observable
  String token = "";

  @observable
  bool isValidToken = false;

  setAccessToken(String? value) {
    token = value ?? "";
  }

  setUserCredential(AuthSignInModel authSignInModel) {
    setCustomerId(authSignInModel.customerId);
    setAccessToken(authSignInModel.token);
    setCustomerId(authSignInModel.customerId);
    setCustomerEmail(authSignInModel.email);
    setCustomerName(authSignInModel.customerName);
  }

  @computed
  bool get isLogged {
    return token.isNotEmpty && isValidToken;
  }

  @computed
  String get profileNavigateRoute {
    return isLogged
        ? CustomNavigationRouter.customNavigation.shortRoute
        : ProfileRouters.signin.fullRoute;
  }

  @observable
  ObservableFuture<Either<AuthFailure, AuthSignInModel>?>? authSignInModel;

  @action
  Future fetchAuthSignInFromLocal() async {
    authSignInModel =
        _authLocalRepository.fetchAuthSignInFromLocal().asObservable();
    return await authSignInModel?.whenComplete(
      () => authSignInModel!.value!.fold(
        (l) async {
          if (kDebugMode) {
            log("[LOCAL] [ERROR] auth_options ${l.statusMessage.toString()}");
          }
          authSignInModel = null;
          await _localStorageService.set('auth_options', {});
        },
        (r) async {
          String newToken = await refreshToken(r);
          setCustomerId(r.customerId);
          setAccessToken(newToken);
          setCustomerEmail(r.email);
          setCustomerName(r.customerName);
        },
      ),
    );
  }

  @action
  Future fetchAuthSignIn({
    String? customerName,
    String? customerEmail,
    String? customerId,
    String? token,
  }) async {
    AuthSignInModel authSignInModel = AuthSignInModel(
      email: customerEmail,
      token: token,
      customerId: customerId,
      customerName: customerName,
    );

    setAccessToken(authSignInModel.token);
    setCustomerId(authSignInModel.customerId);
    setCustomerEmail(authSignInModel.email);
    setCustomerName(authSignInModel.customerName);

    await _localStorageService.set(
      'auth_options',
      authSignInModel.toMap(),
    );
  }

  @observable
  ObservableFuture<Either<AuthFailure, AuthSignOutModel>?>? authSignOutModel;

  @action
  Future fetchAuthSignOut() async {
    log('LOGOUT AUTH STORE');
    authSignInModel = null;
    await _localStorageService.remove('auth_options');
  }

  @observable
  ObservableFuture<Either<AuthFailure, AuthenticationOutput>?>?
      authenticationObservable;

  @action
  Future<String> refreshToken(AuthSignInModel authSignInModel) async {
    AuthenticationInput authenticationInput =
        AuthenticationInput(id: customerId, token: token, name: customerName);
    authenticationObservable =
        authRepository.refreshToken(authenticationInput).asObservable();

    String tokenNew = "";

    await authenticationObservable?.whenComplete(
      () => authenticationObservable?.value?.fold(
        (l) => null,
        (r) {
          tokenNew = r.token ?? "";
          isValidToken = true;
        },
      ),
    );

    return tokenNew;
  }
}
