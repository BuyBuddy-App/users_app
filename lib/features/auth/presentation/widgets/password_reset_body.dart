import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_container.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/custom/vertical_gap.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/core/utils/validators.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordResetBody extends StatefulWidget {
  PasswordResetBody({super.key});

  @override
  State<PasswordResetBody> createState() => _PasswordResetBodyState();
}

class _PasswordResetBodyState extends State<PasswordResetBody> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalGap(100.h),
              Text(
                LocaleKeys.resetPasswordTitle.tr(),
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32.sp,
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                LocaleKeys.resetPasswordCreatePass.tr(),
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              VerticalGap(100.h),
              CustomContainer(
                width: double.infinity,
                height: 350.h,
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 20.h,
                    children: [
                      CustomTextFormField(
                        controller: newPasswordController,
                        hintText: LocaleKeys.resetPasswordNewPassword.tr(),
                        obscureText: true,
                        helperText: LocaleKeys.resetPasswordNewPasswordError
                            .tr(),
                        validator: Validators.validatePassword,
                      ),
                      CustomTextFormField(
                        controller: confirmPasswordController,
                        hintText: LocaleKeys.resetPasswordNewPassword.tr(),
                        obscureText: true,
                        helperText: LocaleKeys.resetPasswordConfirmPasswordError
                            .tr(),
                        validator: (value) {
                          return Validators.confirmPasswordValidator(
                            value ?? '',
                            newPasswordController.text,
                          );
                        },
                      ),

                      CustomButtonGrad(
                        text: LocaleKeys.authLogin.tr(),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
