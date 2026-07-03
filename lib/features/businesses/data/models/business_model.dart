import 'package:json_annotation/json_annotation.dart';
import 'package:rcl_app/features/businesses/domain/entities/business.dart';

part 'business_model.g.dart';

@JsonSerializable()
class BusinessModel {
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
  final double rating;
  @JsonKey(name: 'review_count')
  final int reviewCount;
  final double? distance;
  @JsonKey(name: 'is_open')
  final bool isOpen;
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  final List<String>? tags;
  final List<String>? photos;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  const BusinessModel({
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
    this.rating = 0.0,
    this.reviewCount = 0,
    this.distance,
    this.isOpen = false,
    this.isFeatured = false,
    this.tags,
    this.photos,
    required this.createdAt,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) => _$BusinessModelFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessModelToJson(this);

  Business toEntity() => Business(
    id: id,
    name: name,
    description: description,
    category: category,
    address: address,
    latitude: latitude,
    longitude: longitude,
    phone: phone,
    website: website,
    logoUrl: logoUrl,
    coverUrl: coverUrl,
    rating: rating,
    reviewCount: reviewCount,
    distance: distance,
    isOpen: isOpen,
    isFeatured: isFeatured,
    tags: tags,
    photos: photos,
    createdAt: createdAt,
  );

  factory BusinessModel.fromEntity(Business entity) => BusinessModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    category: entity.category,
    address: entity.address,
    latitude: entity.latitude,
    longitude: entity.longitude,
    phone: entity.phone,
    website: entity.website,
    logoUrl: entity.logoUrl,
    coverUrl: entity.coverUrl,
    rating: entity.rating,
    reviewCount: entity.reviewCount,
    distance: entity.distance,
    isOpen: entity.isOpen,
    isFeatured: entity.isFeatured,
    tags: entity.tags,
    photos: entity.photos,
    createdAt: entity.createdAt,
  );
}
