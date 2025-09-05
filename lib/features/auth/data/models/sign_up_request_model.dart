
import 'package:buy_buddy_user_app/features/auth/domain/entities/sign_up_request_entity.dart';

class SignUpRequestModel extends SignUpRequestEntity {
  const SignUpRequestModel({
    required super.name,
    required super.email,
    required super.password,
    required super.userName,
  });

  factory SignUpRequestModel.fromEntity(SignUpRequestEntity entity) {
    return SignUpRequestModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
      userName: entity.userName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "userName": userName,
    };
  }

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    return SignUpRequestModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      userName: json['userName'],
    );
  }
}
