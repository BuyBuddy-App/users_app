import 'package:buy_buddy_user_app/translations/codegen_loader.g.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class CustomException extends Failure {
  const CustomException({String message = LocaleKeys.messagesFailuresUnexpectedError})
    : super(message);
}
