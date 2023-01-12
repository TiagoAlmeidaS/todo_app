class HttpClientException<T> implements Exception {
  HttpClientException(this._statusCode, this._statusMessage, this._data);

  final int? _statusCode;
  int? get statusCode => _statusCode;
  final String? _statusMessage;
  String? get statusMessage => _statusMessage;
  final T? _data;
  T? get data => _data;
}
