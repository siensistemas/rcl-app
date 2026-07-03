import 'package:json_annotation/json_annotation.dart';
import 'package:rcl_app/features/promotions/domain/entities/promotion.dart';

part 'promotion_model.g.dart';

@JsonSerializable()
class PromotionModel {
  final int id;
  final String title;
  final String? description;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'business_id')
  final int businessId;
  @JsonKey(name: 'business_name')
  final String? businessName;
  @JsonKey(name: 'discount_type')
  final String discountType;
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'claim_count')
  final int claimCount;
  @JsonKey(name: 'max_claims')
  final int? maxClaims;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const PromotionModel({
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

  factory PromotionModel.fromJson(Map<String, dynamic> json) => _$PromotionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionModelToJson(this);

  Promotion toEntity() => Promotion(
    id: id,
    title: title,
    description: description,
    imageUrl: imageUrl,
    businessId: businessId,
    businessName: businessName,
    discountType: discountType,
    discountValue: discountValue,
    startDate: startDate,
    endDate: endDate,
    isActive: isActive,
    claimCount: claimCount,
    maxClaims: maxClaims,
    createdAt: createdAt,
  );

  factory PromotionModel.fromEntity(Promotion entity) => PromotionModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    imageUrl: entity.imageUrl,
    businessId: entity.businessId,
    businessName: entity.businessName,
    discountType: entity.discountType,
    discountValue: entity.discountValue,
    startDate: entity.startDate,
    endDate: entity.endDate,
    isActive: entity.isActive,
    claimCount: entity.claimCount,
    maxClaims: entity.maxClaims,
    createdAt: entity.createdAt,
  );
}
