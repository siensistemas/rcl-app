import 'package:equatable/equatable.dart';

class Attraction extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String? location;
  final String? imageUrl;
  final String? category;
  final double rating;
  final String? openingHours;

  const Attraction({
    required this.id,
    required this.name,
    this.description,
    this.location,
    this.imageUrl,
    this.category,
    this.rating = 0.0,
    this.openingHours,
  });

  Attraction copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    String? imageUrl,
    String? category,
    double? rating,
    String? openingHours,
  }) {
    return Attraction(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      openingHours: openingHours ?? this.openingHours,
    );
  }

  @override
  List<Object?> get props => [id, name, description, location, imageUrl, category, rating, openingHours];
}
