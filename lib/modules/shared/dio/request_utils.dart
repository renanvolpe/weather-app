import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/utils/endpoint.dart';

class RequestUtils {
  static String pathDio(String endpoint) => Endpoint.apiV1 + endpoint;

  static Map<String, String> allParams(Map<String, String>? params) {
    return {"key": dotenv.env['KEY']!, ...?params};
  }

  static Options headerRequestDio() =>
      Options(headers: {"Content-Type": "application/json"});
}
