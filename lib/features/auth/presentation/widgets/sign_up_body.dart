import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/custom/vertical_gap.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/core/utils/app_constants.dart';
import 'package:buy_buddy_user_app/core/utils/validators.dart';
import 'package:buy_buddy_user_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:buy_buddy_user_app/features/auth/domain/entities/sign_up_request_entity.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/cubits/signup_cubits/sign_up_cubit.dart';
import 'package:buy_buddy_user_app/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final bool checkVal = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
  }

  void submitSignUpForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final SignUpRequestEntity signUpRequestEntity = SignUpRequestEntity(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
      );

      final model = SignUpRequestModel.fromEntity(signUpRequestEntity);

      BlocProvider.of<SignUpCubit>(context).signUp(data: model.toJson());
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.horizontalPadding,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalGap(84),
                Text(
                  LocaleKeys.authInitialSignUp.tr(),
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.onPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  LocaleKeys.authSignUpCreateAccount.tr(),
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const VerticalGap(61),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.neutralSecondBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: LocaleKeys.authSignUpFullName.tr(),
                        autovalidateMode: autovalidateMode,
                        keyboardType: TextInputType.name,
                        validator: Validators.validateNormalText,
                        helperText: LocaleKeys.authSignUpFullNameHint.tr(),
                      ),
                      const VerticalGap(16),
                      CustomTextFormField(
                        autovalidateMode: autovalidateMode,
                        hintText: LocaleKeys.authSignUpEmail.tr(),
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                        helperText: LocaleKeys.authSignUpEmailHint.tr(),
                      ),
                      const VerticalGap(16),
                      CustomTextFormField(
                        hintText: LocaleKeys.authSignUpUserName.tr(),
                        autovalidateMode: autovalidateMode,
                        keyboardType: TextInputType.phone,
                        validator: Validators.validateNormalText,
                        helperText: LocaleKeys.authSignUpUserNameHint.tr(),
                      ),
                      const VerticalGap(16),
                      CustomTextFormField(
                        autovalidateMode: autovalidateMode,
                        hintText: LocaleKeys.authSignUpPassword.tr(),
                        validator: Validators.validatePassword,
                        helperText: LocaleKeys.authSignUpPasswordHint.tr(),
                      ),

                      const VerticalGap(24),
                      Row(
                        children: [
                          Checkbox(
                            value: checkVal,
                            onChanged: (val) {},
                          ), // TODO: apply same shape in figma
                          Expanded(
                            child: Text(
                              LocaleKeys.authSignUpPrivacyAgreement.tr(),
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomButtonGrad(
                        text: LocaleKeys.authInitialSignUp.tr(),
                        onPressed: () {},
                      ),
                      const VerticalGap(16),
                      AuthSwitchWidget(
                        text: LocaleKeys.authInitialAlreadyHaveAccount.tr(),
                        actionText: LocaleKeys.authSignUpLogin.tr(),
                        onActionTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const VerticalGap(16),
                    ],
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
