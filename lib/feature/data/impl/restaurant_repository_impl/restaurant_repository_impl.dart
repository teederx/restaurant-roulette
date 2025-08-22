import 'package:restaurant_roulette/feature/domain/repository/restaurant_repository.dart';

import '../../model/restaurant/restaurant_model.dart';
import '../../src/data_src.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final DataSrc _dataSrc;

  RestaurantRepositoryImpl({required DataSrc dataSrc}) : _dataSrc = dataSrc;

  @override
  Future<List<RestaurantModel>> searchRestaurants({
    required String term,
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    try {
      return await _dataSrc.searchRestaurants(
        term: term,
        location: location,
        latitude: latitude,
        longitude: longitude,
      );
    } catch (e) {
      rethrow;
    }
  }
}
