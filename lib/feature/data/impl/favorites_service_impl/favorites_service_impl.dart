import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_roulette/feature/domain/repository/favorites_repository.dart';
import '../../model/restaurant/restaurant_model.dart';

class FavoritesServiceImpl implements FavoritesRepository {
  static const String boxName = "favoritesBox"; // match the one opened in main

  Future<Box<RestaurantModel>> _openBox() async {
    return Hive.openBox<RestaurantModel>(boxName);
  }

  @override
  Future<List<RestaurantModel>> getFavoriteRestaurants() async {
    try {
      final box = await _openBox();
      return box.values.toList(); // values are already RestaurantModel
    } catch (e) {
      throw Exception('Failed to get favorite restaurants: $e');
    }
  }

  @override
  Future<void> addFavoriteRestaurant({
    required RestaurantModel restaurant,
  }) async {
    try {
      final box = await _openBox();
      await box.put(restaurant.id, restaurant); // store the object directly
    } catch (e) {
      throw Exception('Failed to add favorite restaurant: $e');
    }
  }

  @override
  Future<void> removeFavoriteRestaurant({required String restaurantId}) async {
    try {
      final box = await _openBox();
      await box.delete(restaurantId);
    } catch (e) {
      throw Exception('Failed to remove favorite restaurant: $e');
    }
  }

  @override
  Future<bool> isFavorite({required String id}) async {
    try {
      final box = await _openBox();
      return box.containsKey(id);
    } catch (e) {
      throw Exception('Failed to check if restaurant is favorite: $e');
    }
  }
}
