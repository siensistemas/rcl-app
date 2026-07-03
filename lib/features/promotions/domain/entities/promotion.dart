import 'package:equatable/equatable.dart';

class Promotion extends Equatable {
  final int id;
  final String title;
  final String? description;
  final String? imageUrl;
  final int businessId;
  final String? businessName;
  final String discountType;
  final double discountValue;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final int claimCount;
  final int? maxClaims;
  final DateTime createdAt;

  const Promotion({
    required this.id,
    required this.title,
    this.description,
    this.imageUrl,
    required this.businessId,
    this.businessName,
    required this.discountType,
    required this.discountValue,
    required this.startDate,
    required this.endDate,
    this.isActive = true,
    this.claimCount = 0,
    this.maxClaims,
    required this.createdAt,
  });

  bool get isExpired => endDate.isBefore(DateTime.now());
  bool get isAvailable => isActive && !isExpired;

  @override
  List<Object?> get props => [
    id, title, description, imageUrl, businessId, businessName,
    discountType, discountValue, startDate, endDate, isActive,
    claimCount, maxClaims, createdAt,
  ];
}
