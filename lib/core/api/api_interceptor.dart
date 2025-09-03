import 'package:buy_buddy_user_app/core/api/api_keys.dart';
import 'package:buy_buddy_user_app/core/api/end_points.dart';
import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/core/utils/app_routes.dart';
import 'package:buy_buddy_user_app/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;

  ApiInterceptor({required this.dio});
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept-language'] = "en";
    options.extra['withCredentials'] = true;

    final token = await AppStorageHelper.getSecureData(StorageKeys.accessToken);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint("error: ApiInterceptor.onError()");
    debugPrint("status message: ${err.response?.statusMessage}");
    debugPrint("response data: ${err.response?.data}");

    if (err.response?.statusCode == 401 ||
        err.response?.statusCode == 403 ||
        err.response?.statusCode == 410) {
      try {
        RequestOptions opts = await handleUnAuthorizedException(err);

        final clonedRequest = await dio.fetch(opts);
        return handler.resolve(clonedRequest);
      } catch (e) {
        debugPrint("error in get refresh token part: ${e.toString()}");
        await forcesUserLogOut(handler, err);
      }
    }

    if (err.response?.data['message'] == "No refreshToken found in cookie") {
      await handleNoRefreshTokenFound(handler, err);
    }
    return handler.next(err);
  }

  Future<void> handleNoRefreshTokenFound(
    ErrorInterceptorHandler handler,
    DioException err,
  ) async {
    debugPrint("No refreshToken found in cookie");
    await forcesUserLogOut(handler, err);
  }

  Future<RequestOptions> handleUnAuthorizedException(DioException err) async {
    debugPrint("error in ApiInterceptors: Unable to verify token");
    final refreshResponse = await dio.get(EndPoints.getRefreshToken);

    final newAccessToken = refreshResponse.data[ApiKeys.accessToken];
    await AppStorageHelper.setSecureData(
      StorageKeys.accessToken,
      newAccessToken,
    );

    final opts = err.requestOptions;
    opts.headers['Authorization'] = 'Bearer $newAccessToken';
    return opts;
  }

  Future<void> forcesUserLogOut(
    ErrorInterceptorHandler handler,
    DioException err,
  ) async {
    await AppStorageHelper.deleteSecureData(StorageKeys.accessToken);

    await AppStorageHelper.setBool(StorageKeys.isLoggedIn, false);

    if (navigatorKey.currentContext == null) {
      debugPrint("Navigator context is null ,can`t navigate to login screen");
    } else {
      debugPrint("Navigating to login screen..");
      Navigator.of(
        navigatorKey.currentContext!,
      ).pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false);
    }
    return handler.next(err);
  }
}
