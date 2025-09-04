import 'package:buy_buddy_user_app/core/custom/custom_button_gmail.dart';
import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final bool checkval = false;
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
                  key: formkey,
                  child: Column(
                    spacing: 10,
                    children: [
                      CustomTextFormField(
                        hintText: LocaleKeys.authLoginEmail.tr(),
                        controller: emailcontroller,
                        // validator: (value) {

                        // },
                      ),
                      CustomTextFormField(
                        hintText: LocaleKeys.authLoginPassword.tr(),
                        controller: passwordcontroller,
                        // validator: (value) {

                        // },
                      ),

                      Row(
                        children: [
                          Checkbox(value: checkval, onChanged: (val) {}),
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
                      Container(
                        width: double.infinity,
                        child: Row(
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
                            LocaleKeys.authInitialAlreadyHaveAccount.tr(),
                            style: TextStyle(
                              color: AppColors.onPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              LocaleKeys.authInitialLogin.tr(),
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
