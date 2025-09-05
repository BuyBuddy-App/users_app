import 'package:buy_buddy_user_app/core/custom/custom_button_gmail.dart';
import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/custom/vertical_gap.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/core/utils/app_routes.dart';
import 'package:buy_buddy_user_app/core/utils/validators.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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

  void submitSignInForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<SignInCubit>(context).signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalGap(30),
                Text(
                  LocaleKeys.authLoginTitle.tr(),
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.onPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  LocaleKeys.authLoginYourAccount.tr(),
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const VerticalGap(48),

                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.neutralSecondBackground,
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
                          controller: passwordController,
                          hintText: LocaleKeys.authLoginPassword.tr(),
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
                          onPressed: submitSignInForm,
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
                        CustomButtonGmail(
                          text: LocaleKeys.authInitialContinueWithGoogle.tr(),
                          onPressed: () {},
                        ),

                        AuthSwitchWidget(
                          text: LocaleKeys.authLoginDontHaveAccount.tr(),
                          actionText: LocaleKeys.authInitialSignUp.tr(),
                          onActionTap: () {
                            Navigator.pushNamed(context, Routes.signUpScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
