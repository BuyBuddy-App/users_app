import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        Expanded(
          child: Divider(
            color: AppColors.buttonBackground,
            radius: BorderRadius.circular(7),
            height: 35,
            thickness: 7,
          ),
        ),
        Text(
          LocaleKeys.authInitialOr.tr(),
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: AppColors.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.buttonBackground,
            radius: BorderRadius.circular(7.r),
            height: 35,
            thickness: 7,
          ),
        ),
      ],
    );
  }
}
