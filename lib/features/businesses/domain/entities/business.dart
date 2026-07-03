import 'package:equatable/equatable.dart';

class Business extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String? category;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? phone;
  final String? website;
  final String? logoUrl;
  final String? coverUrl;
  final double rating;
  final int reviewCount;
  final double? distance;
  final bool isOpen;
  final bool isFeatured;
  final List<String>? tags;
  final List<String>? photos;
  final DateTime createdAt;

  const Business({
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

  Business copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? address,
    double? latitude,
    double? longitude,
    String? phone,
    String? website,
    String? logoUrl,
    String? coverUrl,
    double? rating,
    int? reviewCount,
    double? distance,
    bool? isOpen,
    bool? isFeatured,
    List<String>? tags,
    List<String>? photos,
    DateTime? createdAt,
  }) {
    return Business(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      logoUrl: logoUrl ?? this.logoUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      distance: distance ?? this.distance,
      isOpen: isOpen ?? this.isOpen,
      isFeatured: isFeatured ?? this.isFeatured,
      tags: tags ?? this.tags,
      photos: photos ?? this.photos,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
    id, name, description, category, address, latitude, longitude,
    phone, website, logoUrl, coverUrl, rating, reviewCount, distance,
    isOpen, isFeatured, tags, photos, createdAt,
  ];
}
