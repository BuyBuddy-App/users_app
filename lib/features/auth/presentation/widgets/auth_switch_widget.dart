import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AuthSwitchWidget extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onActionPressed;
  final Color? promptTextColor;
  final Color? actionTextColor;
  final double? promptTextSize;
  final double? actionTextSize;
  const AuthSwitchWidget({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onActionPressed,
    this.promptTextColor,
    this.actionTextColor = AppColors.primary,
    this.promptTextSize = 18,
    this.actionTextSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          promptText,
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xffC3B7E1),
            ),
          ),
        ),
      ],
    );
  }
}
