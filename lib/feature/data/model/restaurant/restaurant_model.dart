// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_roulette/feature/data/model/category/category_model.dart';

import '../location/location_model.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
abstract class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String url,
    @Default([]) List<CategoryModel> categories,
    @Default(LocationModel()) LocationModel location,
    @Default('') @JsonKey(name: 'image_url') String imageUrl,
    @Default(0) @JsonKey(name: 'review_count') int reviewCount,
    @Default(0.0) double rating,
    @Default('') String price,
    @Default([]) List<String> photos,
    @Default(false) bool isFavorite,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
