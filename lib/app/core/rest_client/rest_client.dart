// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:get/get_connect/connect.dart';

class RestClient extends GetConnect{

  final _backendBaseURL = 'http://192.168.1.21:8080';

  RestClient(){
    httpClient.baseUrl = _backendBaseURL;
  }
  
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  
  RestClientException(
    this.message,{
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
