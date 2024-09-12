import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:weather_app/modules/shared/dio/request_utils.dart';

import '../../core/utils/logger.dart';

abstract class DioService {
  Future dioGet({required String endpoint, bool withToken = true, Map<String, String>? params});
  dioPost({required String endpoint, required Map body});
  dioPut({required String endpoint, required Map body, String? token});
  dioDelete({required String endpoint, required Map body});
  dioPatch({required String endpoint, required Map body, String? token});
}

class DioClient implements DioService {
  final Dio _dio;

  DioClient(this._dio) {
    // _dio.options.baseUrl = FlavorConfig.instance.variables["baseUrl"] + Endpoints.apiV1;
    // _dio.options.connectTimeout = const Duration(seconds: 5);
    // _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  void _printLoggSuccess(Response response) =>
      Logg.consoleShow("ENDPOINT :: ${response.requestOptions.path} \nVERB :: ${response.requestOptions.method}");

  @override
  Future<Result<dynamic, dynamic>> dioGet(
      {required String endpoint, bool withToken = true, Map<String, String>? params, String? token}) async {
    dynamic errorMessage;
    try {
      Response response = await _dio.get(
        RequestUtils.pathDio(endpoint),
        queryParameters: params,
        options: RequestUtils.headerRequestDio(token),
      );
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioPost({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;
    try {
      Response response = await _dio.post(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio(token));
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioDelete({required String endpoint, Map? body, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.delete(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio(token));
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioPut({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.put(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio(token));
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }

  @override
  Future<Result<dynamic, dynamic>> dioPatch({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.patch(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio(token));
      _printLoggSuccess(response);
      return Success(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTretment.getError(e);
    }
    return Failure(errorMessage);
  }
}

class ErrorTretment {
  static String getError(DioException e) {
    String errorMessage = "some erro";

    return errorMessage;
  }

  static void _printLoggError(DioException e, String errorMessage) => Logg.error(
      "ENDPOINT :: ${e.requestOptions.path} \nVERB :: ${e.requestOptions.method}  \nSTATUS CODE :: ${e.response?.statusCode}  \nErrorMessage :: $errorMessage");
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
}
