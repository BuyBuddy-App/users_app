import 'package:buy_buddy_user_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color backgroundColor = Colors.black,
  bool showCloseIcon = true,
  int durationDay = 0,
}) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(color: Colors.white)),
    showCloseIcon: showCloseIcon,
    duration: Duration(
      seconds: AppConstants.snackBarDuration,
      days: durationDay,
    ),
    backgroundColor: backgroundColor,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
