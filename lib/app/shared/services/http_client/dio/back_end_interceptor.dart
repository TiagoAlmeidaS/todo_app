import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BackendInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      log("[DIO] [REQUEST] [${options.method.toUpperCase()}] ${options.uri.toString()}");
      // log("[DIO] [REQUEST] [${options.method.toUpperCase()}] ${options.data.toString()}");
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      log("[DIO] [RESPONSE] [${response.requestOptions.method.toUpperCase()}] [${response.statusCode}] ${response.requestOptions.uri.toString()}");
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      log("[DIO] [ERROR] [${err.requestOptions.method.toUpperCase()}] ${err.requestOptions.uri.toString()}");
      log("[DIO] [ERROR] ${err.message}");
      log("[DIO] [ERROR] ${err.response?.data}");
    }
    return super.onError(err, handler);
  }
}
