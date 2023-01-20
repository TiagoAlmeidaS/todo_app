import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/profile/routers/profile_routers.dart';

import '../../../modules/auth/store/auth_store.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      if ((Modular.get<AuthStore>().token.isNotEmpty) &&
          !options.path.contains(ProfileRouters.signin.shortRoute)) ...{
        "Authorization" : Modular.get<AuthStore>().token,
      },
    });
    if (kDebugMode) {
      log("[DIO] [REQUEST] [${options.method.toUpperCase()}] ${options.uri.toString()}");
      log("[DIO] [REQUEST] [${options.method.toUpperCase()}] [HEADERS] ${options.headers.toString()}");
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
