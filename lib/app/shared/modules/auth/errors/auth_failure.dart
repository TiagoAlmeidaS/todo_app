import '../../../services/http_client/errors/http_client_exception.dart';

class AuthFailure extends HttpClientException {
  AuthFailure(int? statusCode, String? statusMessage, dynamic data)
      : super(statusCode ?? 999, statusMessage ?? "Erro Desconhecido", data);
}
