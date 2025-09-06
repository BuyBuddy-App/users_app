import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonGmail extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String? imagePath;
  final Color? background;
  final Color? textColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;

  const CustomButtonGmail({
    super.key,
    this.imagePath,
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.imagesGoogle,
              fit: BoxFit.cover,
              height: 24.h,
              width: 24.w,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.onPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
