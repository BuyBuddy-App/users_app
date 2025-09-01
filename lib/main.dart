import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/core/helpers/on_generate_routes.dart';
import 'package:buy_buddy_user_app/core/services/custom_bloc_observer.dart';
import 'package:buy_buddy_user_app/core/services/get_it_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await AppStorageHelper.init();
  Bloc.observer = CustomBlocObserver();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const BuyBuddyUserApp(),
    ),
  );
}

class BuyBuddyUserApp extends StatelessWidget {
  const BuyBuddyUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
