import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final int id;
  final String title;
  final String? description;
  final DateTime date;
  final String? location;
  final String? imageUrl;
  final String? category;
  final double? price;
  final String? organizer;

  const Event({
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

  Event copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    String? location,
    String? imageUrl,
    String? category,
    double? price,
    String? organizer,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      price: price ?? this.price,
      organizer: organizer ?? this.organizer,
    );
  }

  @override
  List<Object?> get props => [id, title, description, date, location, imageUrl, category, price, organizer];
}
