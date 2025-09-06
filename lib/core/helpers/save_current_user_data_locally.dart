import 'dart:convert';
import 'dart:developer';

import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/features/user/data/models/user_model.dart';
import 'package:buy_buddy_user_app/features/user/domain/entities/user_entity.dart';

Future<void> saveCurrentUserDataLocally({
  required UserEntity user,
}) async {
  try {
    log('save user data in prefs');
    var jsonData = jsonEncode(UserModel.fromEntity(user).toJson());
    log("new user data after save it: ${jsonData.toString()}");
    await AppStorageHelper.setString(
        StorageKeys.currentUser, jsonData);
  } on Exception catch (e) {
    log("exception in saveUserDataInPrefs ==> ${e.toString()}");
  }
}
