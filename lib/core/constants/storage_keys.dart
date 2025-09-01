enum StorageKeys {
  accessToken,
  refreshToken,
  isDarkMode,
  isArabic,
  isLoggedIn,
  currentUser,
}

extension StorageKeysExt on StorageKeys {
  String get key => toString().split('.').last;
}
