import '../../data/model/restaurant/restaurant_model.dart';
import '../repository/restaurant_repository.dart';

class FetchRestaurantsUsecase {
  const FetchRestaurantsUsecase({required this.repository});
  final RestaurantRepository repository;

  Future<List<RestaurantModel>> call({
    required String term,
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    return await repository.searchRestaurants(
      term: term,
      location: location,
      latitude: latitude,
      longitude: longitude,
    );
  }
}