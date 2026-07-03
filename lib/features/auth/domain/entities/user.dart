import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String email;
  final String? fullName;
  final String? phone;
  final String? avatarUrl;
  final String? role;
  final bool isVerified;
  final DateTime createdAt;

  const User({
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

  @override
  List<Object?> get props => [id, username, email, fullName, phone, avatarUrl, role, isVerified, createdAt];
}
