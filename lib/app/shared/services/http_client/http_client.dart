import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/app/modules/components/todo_flush_bar/todo_flush_bar.dart';
import 'package:todo_app/app/shared/services/http_client/interface/i_http_client.dart';
import 'package:todo_app/app/shared/services/http_client/models/http_client_model.dart';

import '../../utils/enum/todo_enum.dart';
import 'errors/http_client_exception.dart';

class HttpClient implements IHttpClient {
  Dio dio;

  HttpClient(this.dio);

  Future<bool> get _checkConnectivity async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    return connectivityResult != ConnectivityResult.none;
  }



  @override
  Future<HttpClientResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (!(await _checkConnectivity)) {
        TodoFlushBar(
          color: FlushBarColor.ERROR,
          message: 'Conexão instável. Verifique sua rede de internet.',
        );
        throw HttpClientException(999, "Sem conexão", {
          "messageError": "Conexão instável. Verifique sua rede de internet."
        });
      }
      var response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return HttpClientResponse(
            response.statusCode, response.statusMessage, response.data);
      } else {
        throw HttpClientException(
            response.statusCode, response.statusMessage, response.data);
      }
    } on HttpClientException catch (e) {
      throw HttpClientException(e.statusCode, e.statusMessage, e.data);
    }
  }

  @override
  Future<HttpClientResponse> delete(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      if (!(await _checkConnectivity)) {
        TodoFlushBar(
          color: FlushBarColor.ERROR,
          message: 'Conexão instável. Verifique sua rede de internet.',
        );
        throw HttpClientException(999, "Sem conexão", {
          "messageError": "Conexão instável. Verifique sua rede de internet."
        });
      }
      var response = await dio.delete(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200) {
        return HttpClientResponse(
            response.statusCode, response.statusMessage, response.data);
      } else {
        throw HttpClientException(
            response.statusCode, response.statusMessage, response.data);
      }
    } on HttpClientException catch (e) {
      throw HttpClientException(e.statusCode, e.statusMessage, e.data);
    } on DioError catch (e) {
      log(e.message);
      throw HttpClientException(
          e.response?.statusCode, e.response?.statusMessage, e.response?.data);
    } catch (e) {
      throw HttpClientException(
        400,
        'Erro genérico',
        {},
      );
    }
  }

  @override
  Future<HttpClientResponse> post(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    try {
      if (!(await _checkConnectivity)) {
        TodoFlushBar(
          color: FlushBarColor.ERROR,
          message: 'Conexão instável. Verifique sua rede de internet.',
        );
        throw HttpClientException(999, "Sem conexão", {
          "messageError": "Conexão instável. Verifique sua rede de internet."
        });
      }
      var response = await dio.post(
        url,
        data: data,
        options: options,
      );
      return HttpClientResponse(
          response.statusCode, response.statusMessage, response.data);
    } on HttpClientException catch (e) {
      throw HttpClientException(e.statusCode, e.statusMessage, e.data);
    } on DioError catch (e) {
      log(e.message);
      throw HttpClientException(
          e.response?.statusCode, e.response?.statusMessage, e.response?.data);
    } catch (e) {
      throw HttpClientException(
        400,
        'Erro genérico',
        {},
      );
    }
  }
}
