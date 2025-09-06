import 'package:buy_buddy_user_app/core/custom/custom_button_gmail.dart';
import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/utils/app_constants.dart';
import 'package:buy_buddy_user_app/core/utils/app_routes.dart';
import 'package:buy_buddy_user_app/core/utils/app_svgs.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/widgets/custom_or_divider.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
          ),
          child: Column(
            spacing: 40.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                spacing: 4.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppSvgs.svgsLogo),
                  Container(
                    height: 32.h,
                    width: 2,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: AppColors.verticalDividerColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text(
                    "BuyBuddy",
                    style: GoogleFonts.playfairDisplay(
                      color: AppColors.onPrimary,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              //hock statement
              FittedBox(
                child: Text(
                  LocaleKeys.authInitialHook.tr(),
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.onPrimary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              Column(
                spacing: 10.h,
                children: [
                  CustomButtonGrad(
                    text: LocaleKeys.authInitialSignUp.tr(),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginScreen,
                      );
                    },
                  ),
                  CustomButtonGrad(
                    text: LocaleKeys.authInitialSignUpBrand.tr(),
                    onPressed: () {},
                  ),

                  CustomOrDivider(),
                  // signin with gmail
                  CustomButtonGmail(
                    text: LocaleKeys.authInitialContinueWithGoogle.tr(),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.authInitialAlreadyHaveAccount.tr(),
                    style: TextStyle(
                      color: AppColors.onPrimary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.authInitialLogin.tr(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffC3B7E1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
