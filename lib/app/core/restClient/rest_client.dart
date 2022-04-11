import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _backendbaseUrl = 'http://api-aldoro.crmsolucoes.com.br';

  RestClient() {
    httpClient.baseUrl = _backendbaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
