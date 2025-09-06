import 'package:buy_buddy_user_app/core/api/api_consumer.dart';
import 'package:buy_buddy_user_app/core/api/api_keys.dart';
import 'package:buy_buddy_user_app/core/api/end_points.dart';
import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/errors/exceptions.dart';
import 'package:buy_buddy_user_app/core/errors/failures.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
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
          CustomException(message: LocaleKeys.messagesFailuresIncorrectCredentials),
        );
      } else if (e.errModel.message == "Please verify your email to continue") {
        return Left(CustomException(message: LocaleKeys.messagesFailuresInactiveUser));
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
      await apiConsumer.post(EndPoints.signUp, data: data);

      await AppStorageHelper.setString(
        StorageKeys.userEmail,
        data[ApiKeys.email],
      );

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
      return Left(CustomException());
    }
  }
}
