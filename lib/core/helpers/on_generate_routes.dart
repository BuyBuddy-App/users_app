import 'dart:developer';

import 'package:buy_buddy_user_app/core/custom/undefined_route_page.dart';
import 'package:buy_buddy_user_app/core/utils/app_routes.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/screens/login_screen.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:buy_buddy_user_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  log("Navigating to ${settings.name}");

  switch (settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case Routes.verifyOtpScreen:
      return MaterialPageRoute(builder: (context) => VerifyOtpScreen());
    case Routes.signUpScreen:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const UndefinedRoutePage(),
      );
  }
}
