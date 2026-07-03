import 'package:rcl_app/features/classifieds/domain/entities/classified.dart';

class ClassifiedModel {
  final int id;
  final String title;
  final String? description;
  final double? price;
  final String? category;
  final List<String>? images;
  final String? contactInfo;
  final DateTime postedDate;

  const ClassifiedModel({
    required this.id,
    required this.title,
    this.description,
    this.price,
    this.category,
    this.images,
    this.contactInfo,
    required this.postedDate,
  });

  factory ClassifiedModel.fromJson(Map<String, dynamic> json) => ClassifiedModel(
    id: (json['id'] as num).toInt(),
    title: json['title'] as String,
    description: json['description'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    category: json['category'] as String?,
    images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    contactInfo: json['contact_info'] as String?,
    postedDate: DateTime.parse(json['posted_date'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'category': category,
    'images': images,
    'contact_info': contactInfo,
    'posted_date': postedDate.toIso8601String(),
  };

  Classified toEntity() => Classified(
    id: id,
    title: title,
    description: description,
    price: price,
    category: category,
    images: images,
    contactInfo: contactInfo,
    postedDate: postedDate,
  );

  factory ClassifiedModel.fromEntity(Classified entity) => ClassifiedModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    price: entity.price,
    category: entity.category,
    images: entity.images,
    contactInfo: entity.contactInfo,
    postedDate: entity.postedDate,
  );
}
