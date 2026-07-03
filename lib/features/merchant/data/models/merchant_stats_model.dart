import 'package:json_annotation/json_annotation.dart';

part 'merchant_stats_model.g.dart';

@JsonSerializable()
class MerchantStatsModel {
  @JsonKey(name: 'total_views')
  final int totalViews;
  @JsonKey(name: 'total_claims')
  final int totalClaims;
  @JsonKey(name: 'active_promotions')
  final int activePromotions;
  @JsonKey(name: 'total_promotions')
  final int totalPromotions;
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @JsonKey(name: 'total_reviews')
  final int totalReviews;
  @JsonKey(name: 'daily_views')
  final List<DailyView>? dailyViews;

  const MerchantStatsModel({
    this.totalViews = 0,
    this.totalClaims = 0,
    this.activePromotions = 0,
    this.totalPromotions = 0,
    this.averageRating = 0.0,
    this.totalReviews = 0,
    this.dailyViews,
  });

  factory MerchantStatsModel.fromJson(Map<String, dynamic> json) => _$MerchantStatsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantStatsModelToJson(this);
}

@JsonSerializable()
class DailyView {
  final String date;
  final int count;

  const DailyView({required this.date, required this.count});

  factory DailyView.fromJson(Map<String, dynamic> json) => _$DailyViewFromJson(json);
  Map<String, dynamic> toJson() => _$DailyViewToJson(this);
}
