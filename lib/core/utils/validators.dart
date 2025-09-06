import 'package:easy_localization/easy_localization.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';

class Validators {
  static String? validateNormalText(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationFieldIsRequired.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationEmailIsRequired.tr();
    } else if (!regex.hasMatch(value)) {
      return LocaleKeys.validationInvalidEmail.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationPasswordIsRequired.tr();
    } else if (value.length < 8) {
      return LocaleKeys.validationPasswordTooShort.tr();
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationConfirmPasswordIsRequired.tr();
    } else if (password == null || password.isEmpty) {
      return LocaleKeys.validationPasswordIsRequired.tr();
    } else if (value != password) {
      return LocaleKeys.validationPasswordsDoNotMatch.tr();
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    const phonePattern = r'^\+?[0-9]{11}$';
    final regex = RegExp(phonePattern);
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationPhoneIsRequired.tr();
    } else if (!regex.hasMatch(value)) {
      return LocaleKeys.validationInvalidPhone.tr();
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validationAgeIsRequired.tr();
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return LocaleKeys.validationInvalidAge.tr();
    }
    if (age < 14) {
      return LocaleKeys.validationAgeTooYoung.tr();
    }
    if (age > 120) {
      return LocaleKeys.validationAgeTooOld.tr();
    }
    return null;
  }
}
