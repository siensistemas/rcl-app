import 'package:json_annotation/json_annotation.dart';

part 'merchant_business_model.g.dart';

@JsonSerializable()
class MerchantBusinessModel {
  final int id;
  final String name;
  final String? description;
  final String? category;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? phone;
  final String? website;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @JsonKey(name: 'promotion_count')
  final int promotionCount;
  @JsonKey(name: 'view_count')
  final int viewCount;
  @JsonKey(name: 'claim_count')
  final int claimCount;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const MerchantBusinessModel({
    required this.id,
    required this.name,
    this.description,
    this.category,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.website,
    this.logoUrl,
    this.coverUrl,
    this.isActive = true,
    this.isVerified = false,
    this.promotionCount = 0,
    this.viewCount = 0,
    this.claimCount = 0,
    required this.createdAt,
  });

  factory MerchantBusinessModel.fromJson(Map<String, dynamic> json) => _$MerchantBusinessModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantBusinessModelToJson(this);
}
