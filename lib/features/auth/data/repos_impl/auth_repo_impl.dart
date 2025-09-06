import 'package:buy_buddy_user_app/core/api/api_consumer.dart';
import 'package:buy_buddy_user_app/core/api/api_keys.dart';
import 'package:buy_buddy_user_app/core/api/end_points.dart';
import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/errors/exceptions.dart';
import 'package:buy_buddy_user_app/core/errors/failures.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/core/helpers/save_current_user_data_locally.dart';
import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
import 'package:buy_buddy_user_app/features/user/data/models/user_model.dart';
import 'package:buy_buddy_user_app/features/user/domain/entities/user_entity.dart';
import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer apiConsumer;
  AuthRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await apiConsumer.post(
        EndPoints.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );

      debugPrint(result.toString());

      final accessToken = result[ApiKeys.accessToken];
      await AppStorageHelper.setSecureData(
        StorageKeys.accessToken,
        accessToken,
      );

      debugPrint("access token is saved in secure data");
      await AppStorageHelper.setBool(StorageKeys.isLoggedIn, true);

      // TODO: If login doesn't return user data, call getCurrentUser() here.

      return const Right(null);
    } on ConnectionException catch (e) {
      debugPrint("ConnectionException in signInWithEmailAndPassword : $e");
      return Left(CustomException(message: e.message));
    } on ServerException catch (e) {
      debugPrint("ServerException in signInWithEmailAndPassword: $e");

      if (e.errModel.message == "Invalid email or password") {
        return Left(
          CustomException(
            message: LocaleKeys.messagesFailuresIncorrectCredentials,
          ),
        );
      } else if (e.errModel.message == "Please verify your email to continue") {
        return Left(
          CustomException(message: LocaleKeys.messagesFailuresInactiveUser),
        );
      }
      return Left(CustomException());
    } catch (e) {
      debugPrint("Unexpected error in signInWithEmailAndPassword: $e");
      return Left(CustomException());
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required Map<String, dynamic> data,
  }) async {
    try {
      final result = await apiConsumer.post(EndPoints.signUp, data: data);

      final UserEntity currentUser = UserModel.fromJson(
        result["data"]["account"],
      ).toEntity();

      await saveCurrentUserDataLocally(user: currentUser);

      return const Right(null);
    } on ConnectionException catch (e) {
      return Left(CustomException(message: e.message));
    } on ServerException catch (e) {
      if (e.errModel.message == "user already found!") {
        return Left(
          CustomException(
            message: "An account with this email already exists.",
          ),
        );
      } else if (e.errModel.message == "user with this number already found!") {
        return Left(
          CustomException(
            message:
                "This phone number is already linked to an existing account.",
          ),
        );
      }
      return Left(CustomException());
    } catch (e) {
      debugPrint("Unexpected error in signUp: $e");
      return Left(CustomException());
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String code,
  }) async {
    try {
      final result = await apiConsumer.post(
        EndPoints.verifyEmail,
        data: {ApiKeys.email: email, ApiKeys.code: code},
      );
      final accessToken = result[ApiKeys.accessToken];
      await AppStorageHelper.setSecureData(
        StorageKeys.accessToken,
        accessToken,
      );

      await AppStorageHelper.setBool(StorageKeys.isLoggedIn, true);

      return const Right(null);
    } on ConnectionException catch (e) {
      return Left(CustomException(message: e.message));
    } on ServerException catch (e) {
      if (e.errModel.message == "Invalid or expired verification code.") {
        return Left(
          CustomException(
            message:
                "The code you entered is Invalid or expired. Please try again.",
          ),
        );
      } else if (e.errModel.message == "Invalid email") {
        return Left(
          CustomException(
            message: "We couldn’t find an account with this email.",
          ),
        );
      }
      return Left(CustomException());
    } catch (e) {
      debugPrint("Unexpected error in verifyOtp: $e");
      return Left(CustomException());
    }
  }

  @override
  Future<Either<Failure, void>> resendVerifyOtp({required String email}) async {
    try {
      await apiConsumer.post(
        EndPoints.resendVerifyOtp,
        data: {ApiKeys.email: email},
      );

      return const Right(null);
    } on ConnectionException catch (e) {
      return Left(CustomException(message: e.message));
    } on ServerException catch (e) {
      if (e.errModel.message == "Invalid email") {
        return Left(
          CustomException(
            message: "We couldn’t find an account with this email.",
          ),
        );
      } else if (e.errModel.message == "user already active") {
        return Left(
          CustomException(
            message:
                "Your account is already active. No further action is needed.",
          ),
        );
      }
      return Left(CustomException());
    } catch (e) {
      debugPrint("Unexpected error in resendVerifyOtp: $e");
      return Left(CustomException());
    }
  }
}
