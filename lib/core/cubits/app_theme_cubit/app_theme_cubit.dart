import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/cubits/app_theme_cubit/app_theme_state.dart';
import 'package:buy_buddy_user_app/core/enums/app_theme_mode.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitialState()) {
    _loadInitTheme();
  }

  AppThemeMode currentTheme = AppThemeMode.system;

  void _loadInitTheme() {
    String? savedTheme = AppStorageHelper.getString(StorageKeys.themeMode);

    if (savedTheme != null) {
      currentTheme = AppThemeMode.values.firstWhere(
        (element) => element.name == savedTheme,
        orElse: () => AppThemeMode.system,
      );
    } else {
      currentTheme = AppThemeMode.system;
    }
    emit(AppThemeChangedState());
  }

  Future<void> changeTheme(AppThemeMode theme) async {
    currentTheme = theme;

    await AppStorageHelper.setString(StorageKeys.themeMode, currentTheme.name);

    emit(AppThemeChangedState());
  }

  ThemeMode getTheme() {
    switch (currentTheme) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
