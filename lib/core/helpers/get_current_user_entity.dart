import 'dart:convert';

import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/errors/failures.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/features/user/data/models/user_model.dart';
import 'package:buy_buddy_user_app/features/user/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

UserEntity? getCurrentUserEntity() {
  try {
    var jsonString = AppStorageHelper.getString(StorageKeys.currentUser);

    if (jsonString == null || jsonString.isEmpty) {
      debugPrint(
        "User data is null or empty. error in getCurrentUserEntityMethod",
      );
      return null;
    }

    debugPrint("current user data $jsonString");
    var jsonData = jsonDecode(jsonString);

    UserEntity userEntity = UserModel.fromJson(jsonData);

    return userEntity;
  } catch (e) {
    debugPrint("Error while fetching the current user entity: $e");
    throw const CustomException();
  }
}
