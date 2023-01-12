import '../../../shared/services/http_client/errors/http_client_exception.dart';

class NotesFeedFailure extends HttpClientException {
  final int status;
  final String message;
  final dynamic data;

  NotesFeedFailure({this.status = 0, this.message = '', this.data})
      : super(status, message, data);
}

class NotesFeedException extends NotesFeedFailure {
  HttpClientException? httpClientException;

  NotesFeedException(this.httpClientException);
}
