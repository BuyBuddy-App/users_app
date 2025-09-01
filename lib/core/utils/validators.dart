import 'package:buy_buddy_user_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class Validators {
  static String? validateNormalText(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldIsRequired;
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    const String emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final RegExp regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return AppStrings.emailIsRequired;
    } else if (!regex.hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordIsRequired;
    } else if (value.length < 8) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  static String? confirmPasswordValidator(
      BuildContext context, String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordIsRequired;
    } else if (password == null || password.isEmpty) {
      return AppStrings.passwordIsRequired;
    } else if (value != password) {
      return AppStrings.passwordsDoNotMatch;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(BuildContext context, String? value) {
    const String phonePattern = r'^\+?[0-9]{11}$';
    final RegExp regex = RegExp(phonePattern);
    if (value == null || value.isEmpty) {
      return AppStrings.phoneIsRequired;
    } else if (!regex.hasMatch(value)) {
      return AppStrings.invalidPhone;
    }
    return null;
  }

  static String? validateAge(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.ageIsRequired;
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return AppStrings.invalidAge;
    }
    if (age < 14) {
      return AppStrings.ageTooYoung;
    }
    if (age > 150) {
      return AppStrings.ageTooOld;
    }
    return null;
  }
}
