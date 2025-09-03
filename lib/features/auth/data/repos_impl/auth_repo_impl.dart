import 'package:buy_buddy_user_app/core/api/api_consumer.dart';
import 'package:buy_buddy_user_app/core/api/api_keys.dart';
import 'package:buy_buddy_user_app/core/api/end_points.dart';
import 'package:buy_buddy_user_app/core/constants/failure_messages.dart';
import 'package:buy_buddy_user_app/core/constants/storage_keys.dart';
import 'package:buy_buddy_user_app/core/errors/exceptions.dart';
import 'package:buy_buddy_user_app/core/errors/failures.dart';
import 'package:buy_buddy_user_app/core/helpers/app_storage_helper.dart';
import 'package:buy_buddy_user_app/features/auth/domain/repos/auth_repo.dart';
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

      if (e.errModel.message == "wrong credential") {
        return Left(
          CustomException(message: FailureMessages.incorrectCredentials),
        );
      } else if (e.errModel.message == "user is not active") {
        return Left(CustomException(message: FailureMessages.inactiveUser));
      }
      return Left(CustomException());
    } catch (e) {
      debugPrint("Unexpected error in signInWithEmailAndPassword: $e");
      return Left(CustomException());
    }
  }
}
