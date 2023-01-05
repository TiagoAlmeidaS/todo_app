import 'package:todo_app/app/shared/services/http_client/models/http_client_model.dart';

abstract class IHttpClient {
  Future<HttpClientResponse> get(String url);
  Future<HttpClientResponse> post(String url, {dynamic data});
  Future<HttpClientResponse> delete(String url);
}

