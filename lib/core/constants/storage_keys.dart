class StorageKeys {
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String themeMode = "themeMode";
  static const String isArabic = "isArabic";
  static const String isLoggedIn = "isLoggedIn";
  static const String currentUser = "currentUser";
}

extension StorageKeysExt on StorageKeys {
  String get key => toString().split('.').last;
}
