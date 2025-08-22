import '../../data/model/restaurant/restaurant_model.dart';

abstract class FavoritesRepository {
  Future<List<RestaurantModel>> getFavoriteRestaurants();

  Future<void> addFavoriteRestaurant({required RestaurantModel restaurant});

  Future<void> removeFavoriteRestaurant({required String restaurantId});

  Future<bool> isFavorite({required String id});
}
