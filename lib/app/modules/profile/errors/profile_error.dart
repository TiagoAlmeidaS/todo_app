import '../../../shared/services/http_client/errors/http_client_exception.dart';

class ProfileFailure extends HttpClientException {
  final int status;
  final String message;
  final dynamic data;

  ProfileFailure({this.status = 0, this.message = '', this.data})
      : super(status, message, data);
}

class ProfileException extends ProfileFailure {
  HttpClientException? httpClientException;

  ProfileException(this.httpClientException);
}
