import 'package:rcl_app/features/events/domain/entities/event.dart';

class EventModel {
  final int id;
  final String title;
  final String? description;
  final DateTime date;
  final String? location;
  final String? imageUrl;
  final String? category;
  final double? price;
  final String? organizer;

  const EventModel({
    required this.id,
    required this.title,
    this.description,
    required this.date,
    this.location,
    this.imageUrl,
    this.category,
    this.price,
    this.organizer,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: (json['id'] as num).toInt(),
    title: json['title'] as String,
    description: json['description'] as String?,
    date: DateTime.parse(json['date'] as String),
    location: json['location'] as String?,
    imageUrl: json['image_url'] as String?,
    category: json['category'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    organizer: json['organizer'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'date': date.toIso8601String(),
    'location': location,
    'image_url': imageUrl,
    'category': category,
    'price': price,
    'organizer': organizer,
  };

  Event toEntity() => Event(
    id: id,
    title: title,
    description: description,
    date: date,
    location: location,
    imageUrl: imageUrl,
    category: category,
    price: price,
    organizer: organizer,
  );

  factory EventModel.fromEntity(Event entity) => EventModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    date: entity.date,
    location: entity.location,
    imageUrl: entity.imageUrl,
    category: entity.category,
    price: entity.price,
    organizer: entity.organizer,
  );
}
