import 'dart:io';

import 'package:buy_buddy_user_app/core/api/api_consumer.dart';
import 'package:buy_buddy_user_app/core/api/dio_consumer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<Connectivity>(Connectivity());

  // cookies
  Directory appDocDir = await getApplicationDocumentsDirectory();

  final tempPath = appDocDir.path;
  final cookieJar = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage(tempPath),
  );

  getIt.registerSingleton<CookieJar>(cookieJar);

  // dio
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: getIt<Dio>()));
}
