class HttpClientResponse {
  HttpClientResponse(this.statusCode, this.statusMessage, this.data);

  final int? statusCode;
  final String? statusMessage;
  final dynamic data;
}