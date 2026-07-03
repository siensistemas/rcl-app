import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String? icon;
  final String? image;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @JsonKey(name: 'business_count')
  final int businessCount;

  const CategoryModel({
    required this.id,
    required this.name,
    this.icon,
    this.image,
    this.parentId,
    this.businessCount = 0,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
