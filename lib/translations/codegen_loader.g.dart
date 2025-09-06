abstract class LocaleKeys {
  // messages.success
  static const messagesSuccessVerificationCodeSent =
      "messages.success.verification_code_sent";

  // messages.failures
  static const messagesFailuresIncorrectCredentials =
      "messages.failures.incorrect_credentials";
  static const messagesFailuresInactiveUser = "messages.failures.inactive_user";
  static const messagesFailuresUnexpectedError =
      "messages.failures.unexpected_error";
  static const messagesFailuresAccountAlreadyExists =
      "messages.failures.account_already_exists";
  static const messagesFailuresUsernameAlreadyExists =
      "messages.failures.username_already_exists";
  static const messagesFailuresInvalidOrExpiredCode =
      "messages.failures.invalid_or_expired_code";
  static const messagesFailuresInvalidEmail = "messages.failures.invalid_email";
  static const messagesFailuresUserAlreadyActive =
      "messages.failures.user_already_active";

  // validation
  static const validationFieldIsRequired = "validation.field_is_required";
  static const validationEmailIsRequired = "validation.email_is_required";
  static const validationInvalidEmail = "validation.invalid_email";
  static const validationPasswordIsRequired = "validation.password_is_required";
  static const validationPasswordTooShort = "validation.password_too_short";
  static const validationPhoneIsRequired = "validation.phone_is_required";
  static const validationInvalidPhone = "validation.invalid_phone";
  static const validationAgeIsRequired = "validation.age_is_required";
  static const validationInvalidAge = "validation.invalid_age";
  static const validationAgeTooYoung = "validation.age_too_young";
  static const validationAgeTooOld = "validation.age_too_old";
  static const validationConfirmPasswordIsRequired =
      "validation.confirm_password_is_required";
  static const validationPasswordsDoNotMatch =
      "validation.passwords_do_not_match";
  static const validationPasswordMustContain6Chars =
      "validation.password_must_contain_6_chars";

  // auth_initial
  static const authInitialName = "auth.auth_initial.name";
  static const authInitialHook = "auth.auth_initial.hook";
  static const authInitialSignUp = "auth.auth_initial.sign_up";
  static const authInitialSignUpBrand = "auth.auth_initial.sign_up_brand";
  static const authInitialOr = "auth.auth_initial.or";
  static const authInitialContinueWithGoogle =
      "auth.auth_initial.continue_with_google";
  static const authInitialAlreadyHaveAccount =
      "auth.auth_initial.already_have_account";
  static const authInitialLogin = "auth.auth_initial.login";

  // auth_login
  static const authLoginTitle = "auth.auth_login.title";
  static const authLoginYourAccount = "auth.auth_login.login_your_account";
  static const authLoginEmail = "auth.auth_login.email";
  static const authLoginEmailError = "auth.auth_login.email_error";
  static const authLoginPassword = "auth.auth_login.password";
  static const authLoginPasswordError = "auth.auth_login.password_error";
  static const authLoginRememberMe = "auth.auth_login.remember_me";
  static const authLoginForgotPassword = "auth.auth_login.forgot_password";
  static const authLogin = "auth.auth_login.login";
  static const authLoginDontHaveAccount = "auth.auth_login.dont_have_account";

  // reset_password
  static const resetPasswordTitle = "auth.reset_password.reset_password";
  static const resetPasswordCreatePass =
      "auth.reset_password.create_your_new_pass";
  static const resetPasswordNewPassword = "auth.reset_password.new_password";
  static const resetPasswordNewPasswordError =
      "auth.reset_password.new_password_error";
  static const resetPasswordConfirmPassword =
      "auth.reset_password.confirm_password";
  static const resetPasswordConfirmPasswordError =
      "auth.reset_password.confirm_password_error";

  // auth_sign_up
  static const authSignUpCreateAccount =
      "auth.auth_sign_up.create_your_new_account";
  static const authSignUpFullName = "auth.auth_sign_up.full_name";
  static const authSignUpFullNameHint = "auth.auth_sign_up.full_name_hint";
  static const authSignUpEmail = "auth.auth_sign_up.email";
  static const authSignUpEmailHint = "auth.auth_sign_up.email_hint";
  static const authSignUpUserName = "auth.auth_sign_up.user_name";
  static const authSignUpUserNameHint = "auth.auth_sign_up.user_name_hint";
  static const authSignUpPassword = "auth.auth_sign_up.password";
  static const authSignUpPasswordHint = "auth.auth_sign_up.password_hint";
  static const authSignUpPrivacyAgreement =
      "auth.auth_sign_up.privacy_agreement";
  static const authSignUpLogin = "auth.auth_sign_up.login";

  // auth_verify
  static const authVerifyCheckEmail = "auth.auth_verify.check_email";
  static const authVerifyDescription = "auth.auth_verify.description";
  static const authVerifyEnterDigits = "auth.auth_verify.enter_digits";
  static const authVerifySendAgain = "auth.auth_verify.send_again";

  // auth_profile
  static const authProfileSkip = "auth.auth_profile.skip";
  static const authProfileFillProfile = "auth.auth_profile.fill_profile";
  static const authProfileUploadImage = "auth.auth_profile.upload_image";
  static const authProfilePhoneNumber = "auth.auth_profile.phone_number";
  static const authProfilePhoneNumberError =
      "auth.auth_profile.phone_number_error";
  static const authProfileGender = "auth.auth_profile.gender";
  static const authProfileSelectGender = "auth.auth_profile.select_gender";
  static const authProfileMale = "auth.auth_profile.male";
  static const authProfileFemale = "auth.auth_profile.female";
  static const authProfileSet = "auth.auth_profile.set";
  static const authProfileNext = "auth.auth_profile.next";
  static const authProfileSelectBirth = "auth.auth_profile.select_birth";
  static const authProfileBirth = "auth.auth_profile.birthday";
}
