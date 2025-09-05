import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_container.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';

class VerifyOtpBody extends StatelessWidget {
  const VerifyOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    String otpCode;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.w),
              Text(
                LocaleKeys.authVerifyCheckEmail.tr(),
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.authVerifyDescription.tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onPrimary,
                ),
              ),
              const SizedBox(height: 32),

              CustomContainer(
                width: 361.w,
                height: 348.w,
                child: Column(
                  spacing: 10.w,
                  children: [
                    SizedBox(height: 5.w),
                    Text(
                      LocaleKeys.authVerifyEnterDigits.tr(),
                      style: GoogleFonts.inter(
                        color: AppColors.onPrimary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.w),
                    Pinput(
                      length: 6,
                      onChanged: (value) => otpCode = value,
                      onCompleted: (value) {
                        // submit otp code with cubit

                        otpCode = value;
                      },
                      focusedPinTheme: PinTheme(
                        width: 40.w,
                        height: 40.w,
                        textStyle: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff19191980),
                              offset: Offset(-2, -2),
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              color: Color(0xff64646466),
                              offset: Offset(2, 2),
                              blurRadius: 2,
                            ),
                          ],

                          color: Color(0xff88868633).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        width: 40.w,
                        height: 40.w,
                        textStyle: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff1E1E1E4D),
                              offset: Offset(3, 3),
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              color: AppColors.primary,
                              offset: Offset(-3, -3),
                              blurRadius: 2,
                            ),
                          ],
                          color: const Color(0xff141414),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.w),
                    CustomButtonGrad(
                      text: LocaleKeys.authVerifySendAgain.tr(),
                      onPressed: () {
                        // send again
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
