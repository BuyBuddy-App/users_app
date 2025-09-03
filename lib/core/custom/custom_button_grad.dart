import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonGrad extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? background;
  final Color? textColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;

  const CustomButtonGrad({
    super.key,
    required this.text,
    required this.onPressed,
    this.background,
    this.textColor,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: AppColors.gradColors),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth), // thickness of border
        decoration: BoxDecoration(
          color: background ?? AppColors.buttonBackground,
          borderRadius: BorderRadius.circular(borderRadius - borderWidth),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? AppColors.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
