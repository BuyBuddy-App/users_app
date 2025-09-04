import 'package:buy_buddy_user_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
