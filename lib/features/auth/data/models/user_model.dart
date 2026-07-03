import 'package:json_annotation/json_annotation.dart';
import 'package:rcl_app/features/auth/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? phone;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  final String? role;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.fullName,
    this.phone,
    this.avatarUrl,
    this.role,
    this.isVerified = false,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
    id: id,
    username: username,
    email: email,
    fullName: fullName,
    phone: phone,
    avatarUrl: avatarUrl,
    role: role,
    isVerified: isVerified,
    createdAt: createdAt,
  );

  factory UserModel.empty() => UserModel(
    id: 0,
    username: '',
    email: '',
    isVerified: false,
    createdAt: DateTime.now(),
  );

  factory UserModel.fromEntity(User entity) => UserModel(
    id: entity.id,
    username: entity.username,
    email: entity.email,
    fullName: entity.fullName,
    phone: entity.phone,
    avatarUrl: entity.avatarUrl,
    role: entity.role,
    isVerified: entity.isVerified,
    createdAt: entity.createdAt,
  );
}
