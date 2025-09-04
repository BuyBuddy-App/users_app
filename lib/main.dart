import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/core/helpers/on_generate_routes.dart';
import 'package:buy_buddy_user_app/core/services/custom_bloc_observer.dart';
import 'package:buy_buddy_user_app/core/services/get_it_service.dart';
import 'package:buy_buddy_user_app/features/auth/presentaion/screens/initial_screen.dart';
import 'package:buy_buddy_user_app/core/utils/app_themes.dart';
import 'package:buy_buddy_user_app/features/auth/presentaion/screens/login_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupGetIt();
  await AppStorageHelper.init();
  Bloc.observer = CustomBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: DevicePreview(
        enabled: kDebugMode,
        builder: (context) => const BuyBuddyUserApp(),
      ),
    ),
  );
}

class BuyBuddyUserApp extends StatelessWidget {
  const BuyBuddyUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      home: LoginScreen(),
    );
  }
}
