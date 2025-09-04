import 'package:buy_buddy_user_app/core/custom/custom_button_gmail.dart';
import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/core/utils/validators.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final bool checkVal = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                LocaleKeys.authLoginTitle.tr(),
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.onPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.authLoginYourAccount.tr(),
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff131313),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 10,
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        hintText: LocaleKeys.authLoginEmail.tr(),
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),
                      CustomTextFormField(
                        hintText: LocaleKeys.authLoginPassword.tr(),
                        controller: passwordController,
                        validator: Validators.validatePassword,
                      ),

                      Row(
                        children: [
                          Checkbox(value: checkVal, onChanged: (val) {}),
                          Expanded(
                            child: Text(
                              LocaleKeys.authLoginRememberMe.tr(),
                              style: TextStyle(
                                color: AppColors.onPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            LocaleKeys.authLoginForgotPassword.tr(),
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      CustomButtonGrad(
                        text: LocaleKeys.authLogin.tr(),
                        onPressed: () {},
                      ),
                      Row(
                        spacing: 20,
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.buttonBackground,
                              radius: BorderRadius.circular(7),
                              height: 35,
                              thickness: 7,
                            ),
                          ),
                          Text(LocaleKeys.authInitialOr.tr()),
                          Expanded(
                            child: Divider(
                              color: AppColors.buttonBackground,
                              radius: BorderRadius.circular(7),
                              height: 35,
                              thickness: 7,
                            ),
                          ),
                        ],
                      ),
                      // signin with gmail
                      CustomButtonGmail(
                        text: LocaleKeys.authInitialContinueWithGoogle.tr(),
                        onPressed: () {},
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.authLoginDontHaveAccount.tr(),
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              LocaleKeys.authInitialSignUp.tr(),
                              style: TextStyle(
                                fontSize: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
