import 'package:buy_buddy_user_app/core/api/api_consumer.dart';
import 'package:buy_buddy_user_app/core/api/api_interceptor.dart';
import 'package:buy_buddy_user_app/core/api/api_urls.dart';
import 'package:buy_buddy_user_app/core/errors/handle_dio_exceptions.dart';
import 'package:buy_buddy_user_app/core/services/convert_data_to_form_data.dart';
import 'package:buy_buddy_user_app/core/services/get_it_service.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiUrls.baseUrl;

    dio.interceptors.add(CookieManager(getIt<CookieJar>()));
    dio.interceptors.add(ApiInterceptor(dio: dio));
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 15);
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      FormData? formData;
      if (isFromData) {
        formData = await convertDataToFormData(data);
      }
      
      final response = await dio.delete(
        path,
        data: isFromData ? formData : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      FormData? formData;
      if (isFromData) {
        formData = await convertDataToFormData(data);
      }

      final response = await dio.patch(
        path,
        data: isFromData ? formData : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      FormData? formData;
      if (isFromData) {
        formData = await convertDataToFormData(data);
      }

      final response = await dio.post(
        path,
        data: isFromData ? formData : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
