import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app_controller.dart';

class DioCustom {
  final Dio _dio;

  String baseurl = Modular.get<AppController>().baseUrlVariable ?? "";

  DioCustom(this._dio) {
    _dio..options.baseUrl = baseurl
        ..options.responseType = ResponseType.json;
  }
}
