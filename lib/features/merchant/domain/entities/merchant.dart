import 'package:equatable/equatable.dart';

class Merchant extends Equatable {
  final int id;
  final int userId;
  final String businessName;
  final String? description;
  final String? category;
  final String? address;
  final String? phone;
  final String? email;
  final String? logoUrl;
  final String? coverUrl;
  final bool isVerified;
  final bool isActive;
  final DateTime createdAt;

  const Merchant({
    required this.id,
    required this.userId,
    required this.businessName,
    this.description,
    this.category,
    this.address,
    this.phone,
    this.email,
    this.logoUrl,
    this.coverUrl,
    this.isVerified = false,
    this.isActive = true,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id, userId, businessName, description, category, address,
    phone, email, logoUrl, coverUrl, isVerified, isActive, createdAt,
  ];
}
