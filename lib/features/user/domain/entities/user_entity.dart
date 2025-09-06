import 'package:buy_buddy_user_app/core/enums/gender.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? profileImage;
  final Gender? gender;
  final DateTime? birthday;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.profileImage,
    this.gender,
    this.birthday,
    this.createdAt,
    this.updatedAt,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? profileImage,
    Gender? gender,
    DateTime? birthday,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool removeProfileImage = false,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: removeProfileImage
          ? null
          : profileImage ?? this.profileImage,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
