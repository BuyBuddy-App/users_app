import 'package:buy_buddy_user_app/features/user/domain/entities/user_entity.dart';
import 'package:buy_buddy_user_app/core/enums/gender.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.phoneNumber,
    super.profileImage,
    super.gender,
    super.birthday,
    super.createdAt,
    super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['userId']?.toString() ?? json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      gender: _mapGender(json['gender']),
      birthday: json['birthday'] != null
          ? DateTime.tryParse(json['birthday'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'gender': gender?.name,
      'birthday': birthday?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      profileImage: entity.profileImage,
      gender: entity.gender,
      birthday: entity.birthday,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
      gender: gender,
      birthday: birthday,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static Gender? _mapGender(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      return Gender.values.firstWhere(
        (g) => g.name.toLowerCase() == value.toLowerCase(),
        orElse: () => Gender.other,
      );
    }
    return null;
  }
}
