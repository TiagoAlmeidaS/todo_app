import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/app/shared/services/http_client/dio/auth_interceptor.dart';
import 'package:todo_app/app/shared/services/http_client/dio/back_end_interceptor.dart';
import 'package:todo_app/app_controller.dart';
import 'package:dio/adapter.dart';


class DioCustom with DioMixin implements Dio {

  DioCustom() {
    interceptors.addAll([
      AuthInterceptor(),
      BackendInterceptor(),
    ]);

    (httpClientAdapter as DefaultHttpClientAdapter)
      .onHttpClientCreate = _onHttpClientCreate;

    when((_) => Modular.get<AppController>().baseUrlVariable?.isNotEmpty ?? false, () {
      options.baseUrl = Modular.get<AppController>().baseUrlVariable ?? "";
    });
  }

  @override
  BaseOptions options = BaseOptions(
    baseUrl: "${Modular.get<AppController>().baseUrlVariable}",
  );

  HttpClient _onHttpClientCreate(HttpClient httpClient) =>
      HttpClient(context: _context);

  SecurityContext get _context {
    final sc = SecurityContext(withTrustedRoots: false);
    return sc;
  }

  @override
  HttpClientAdapter get httpClientAdapter =>
      DefaultHttpClientAdapter()..onHttpClientCreate = _onHttpClientCreate;

}
