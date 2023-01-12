import '../../../shared/services/http_client/errors/http_client_exception.dart';

class TasksFailure extends HttpClientException {
  final int status;
  final String message;
  final dynamic data;

  TasksFailure({this.status = 0, this.message = '', this.data})
      : super(status, message, data);
}

class TasksException extends TasksFailure {
  HttpClientException? httpClientException;

  TasksException(this.httpClientException);
}
