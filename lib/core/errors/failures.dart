abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class CustomException extends Failure {
  const CustomException({
    String message = "Something went wrong. Please try again later.",
  }) : super(message);
}
