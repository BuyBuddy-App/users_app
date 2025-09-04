import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthSwitchWidget extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onActionTap;
  final Color textColor;
  final Color actionColor;
  final double fontSize;

  const AuthSwitchWidget({
    super.key,
    required this.text,
    required this.actionText,
    required this.onActionTap,
    this.textColor = AppColors.onPrimary,
    this.actionColor = AppColors.actionColor,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onActionTap,
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: actionColor,
            ),
          ),
        ),
      ],
    );
  }
}
