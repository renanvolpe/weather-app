import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../../core/utils/constants/endpoint.dart';

class RequestUtils {
  static String pathDio(String endpoint) => FlavorConfig.instance.variables["baseUrl"] + Endpoint.apiV1 + endpoint;

  static Map defaultMap(Map body) => {
        "data": {"attriutes": body}
      };

  static Options headerRequestDio(String? token) =>
      Options(headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"});

}
