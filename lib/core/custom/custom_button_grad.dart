import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
    this.borderRadius = 18,
    this.borderWidth = 1,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: AppColors.gradColors),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth.r),
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
                style: GoogleFonts.inter(
                  color: textColor ?? AppColors.onPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
