import 'dart:developer';

import 'package:buy_buddy_user_app/core/errors/exceptions.dart';
import 'package:buy_buddy_user_app/core/models/error_model.dart';
import 'package:dio/dio.dart';

void handleDioExceptions(DioException e) {
  log("handle dio exceptions, exception is: ${e.toString()}");

  final data = e.response?.data;

  ServerException serverException() {
    if (data is Map<String, dynamic>) {
      return ServerException(errModel: ErrorModel.fromJson(data));
    }
    return ServerException(
      errModel: ErrorModel(
        message: e.message ?? "Unknown error",
        code: 404,
      ),
    );
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      throw serverException();

    case DioExceptionType.connectionError:
      throw ConnectionException();

    case DioExceptionType.badResponse:
      final status = e.response?.statusCode;
      if (status != null &&
          [400, 401, 403, 404, 409, 422, 504].contains(status)) {
        throw serverException();
      }
      throw serverException();
  }
}
