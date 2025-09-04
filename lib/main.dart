import 'package:buy_buddy_user_app/core/cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:buy_buddy_user_app/core/cubits/app_theme_cubit/app_theme_state.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/core/helpers/on_generate_routes.dart';
import 'package:buy_buddy_user_app/core/services/custom_bloc_observer.dart';
import 'package:buy_buddy_user_app/core/services/get_it_service.dart';
import 'package:buy_buddy_user_app/core/utils/app_themes.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/screens/login_screen.dart';
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

class BuyBuddyUserApp extends StatefulWidget {
  const BuyBuddyUserApp({super.key});

  @override
  State<BuyBuddyUserApp> createState() => _BuyBuddyUserAppState();
}

class _BuyBuddyUserAppState extends State<BuyBuddyUserApp> {
  late AppThemeCubit appThemeCubit;

  @override
  void initState() {
    super.initState();
    appThemeCubit = AppThemeCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appThemeCubit,
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appThemeCubit.getTheme(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateRoute: onGenerateRoutes,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}