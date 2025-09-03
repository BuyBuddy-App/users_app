import 'package:buy_buddy_user_app/core/custom/custom_button_gmail.dart';
import 'package:buy_buddy_user_app/core/custom/custom_button_grad.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,
            child: Column(
              spacing: 50,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    SvgPicture.asset("assets/svgs/logo.svg"),
                    Text(
                      "BuyBuddy",
                      style: GoogleFonts.playfairDisplay(
                        color: AppColors.onPrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                //hock statement
                Text(
                  LocaleKeys.auth_initial_hock.tr(),
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                //signup and signup brand
                Column(
                  spacing: 10,
                  children: [
                    CustomButtonGrad(
                      text: LocaleKeys.auth_initial_sign_up.tr(),
                      onPressed: () {},
                    ),
                    CustomButtonGrad(
                      text: LocaleKeys.auth_initial_sign_up_brand.tr(),
                      onPressed: () {},
                    ),

                    //divider and or
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
                          Text(LocaleKeys.auth_initial_or.tr()),
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
                      imagePath: "assets/images/flat-color-icons_google.png",
                      text: "Continue with google",
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
