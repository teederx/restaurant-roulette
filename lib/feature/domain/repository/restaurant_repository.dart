import '../../data/model/restaurant/restaurant_model.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantModel>> searchRestaurants({
    required String term,
    String? location,
    double? latitude,
    double? longitude,
  });
}