import 'package:rcl_app/features/tourism/domain/entities/attraction.dart';

class AttractionModel {
  final int id;
  final String name;
  final String? description;
  final String? location;
  final String? imageUrl;
  final String? category;
  final double rating;
  final String? openingHours;

  const AttractionModel({
    required this.id,
    required this.name,
    this.description,
    this.location,
    this.imageUrl,
    this.category,
    this.rating = 0.0,
    this.openingHours,
  });

  factory AttractionModel.fromJson(Map<String, dynamic> json) => AttractionModel(
    id: (json['id'] as num).toInt(),
    name: json['name'] as String,
    description: json['description'] as String?,
    location: json['location'] as String?,
    imageUrl: json['image_url'] as String?,
    category: json['category'] as String?,
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    openingHours: json['opening_hours'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'location': location,
    'image_url': imageUrl,
    'category': category,
    'rating': rating,
    'opening_hours': openingHours,
  };

  Attraction toEntity() => Attraction(
    id: id,
    name: name,
    description: description,
    location: location,
    imageUrl: imageUrl,
    category: category,
    rating: rating,
    openingHours: openingHours,
  );

  factory AttractionModel.fromEntity(Attraction entity) => AttractionModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    location: entity.location,
    imageUrl: entity.imageUrl,
    category: entity.category,
    rating: entity.rating,
    openingHours: entity.openingHours,
  );
}
