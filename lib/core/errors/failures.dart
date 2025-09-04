import 'package:buy_buddy_user_app/core/constants/failure_messages.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class CustomException extends Failure {
  const CustomException({
    String message = FailureMessages.unexpectedError,
  }) : super(message);
}
