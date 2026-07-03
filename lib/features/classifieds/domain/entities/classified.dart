import 'package:equatable/equatable.dart';

class Classified extends Equatable {
  final int id;
  final String title;
  final String? description;
  final double? price;
  final String? category;
  final List<String>? images;
  final String? contactInfo;
  final DateTime postedDate;

  const Classified({
    required this.id,
    required this.title,
    this.description,
    this.price,
    this.category,
    this.images,
    this.contactInfo,
    required this.postedDate,
  });

  Classified copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? category,
    List<String>? images,
    String? contactInfo,
    DateTime? postedDate,
  }) {
    return Classified(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      images: images ?? this.images,
      contactInfo: contactInfo ?? this.contactInfo,
      postedDate: postedDate ?? this.postedDate,
    );
  }

  @override
  List<Object?> get props => [id, title, description, price, category, images, contactInfo, postedDate];
}
