import 'dart:io';
import 'package:buy_buddy_user_app/core/custom/custom_circle_grad.dart';
import 'package:buy_buddy_user_app/core/custom/custom_container.dart';
import 'package:buy_buddy_user_app/core/custom/custom_text_form_field.dart';
import 'package:buy_buddy_user_app/core/custom/vertical_gap.dart';
import 'package:buy_buddy_user_app/core/utils/app_colors.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  String selectedValue = LocaleKeys.authProfileMale.tr();

  File? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  List<String> items = [
    LocaleKeys.authProfileMale.tr(),
    LocaleKeys.authProfileFemale.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: Text("")),
                    TextButton(
                      child: Text(
                        LocaleKeys.authProfileSkip.tr(),
                        style: TextStyle(
                          color: Color(0xffC3B7E1),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                VerticalGap(15),
                Text(
                  LocaleKeys.authProfileFillProfile.tr(),
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.onPrimary,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalGap(60),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    CustomContainer(width: double.infinity, height: 500.h),
                    Positioned(
                      top: -40,
                      child: Stack(
                        children: [
                          CustomCircleGrad(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : null,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                onPressed: _pickImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      right: 10,
                      left: 10,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 24),

                            // Full Name
                            CustomTextFormField(
                              controller: nameController,
                              labelText: LocaleKeys.authSignUpUserName.tr(),
                              helperText: LocaleKeys.authSignUpUserNameHint
                                  .tr(),
                            ),
                            const SizedBox(height: 16),

                            // Phone
                            CustomTextFormField(
                              controller: phoneController,
                              labelText: LocaleKeys.authProfilePhoneNumber.tr(),
                              keyboardType: TextInputType.phone,
                              helperText: LocaleKeys.authProfilePhoneNumberError
                                  .tr(),
                            ),
                            const SizedBox(height: 16),

                            // Gender Field with Suffix Button
                            DropdownButtonFormField<String>(
                              value: selectedValue,
                              isExpanded: true, // makes it take full width
                              decoration: InputDecoration(
                                labelText: LocaleKeys.authProfileGender.tr(),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.focusBorder,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  // rounded corners
                                ),
                              ),
                              items: items.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedValue = newValue ?? "";
                                });
                              },
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
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
