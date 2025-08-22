import '../../../data/model/restaurant/restaurant_model.dart';
import '../../repository/favorites_repository.dart';

class AddFavoriteUseCase {
  final FavoritesRepository favoritesRepository;

  AddFavoriteUseCase({required this.favoritesRepository});

  Future<void> call(RestaurantModel restaurant) async {
    await favoritesRepository.addFavoriteRestaurant(restaurant: restaurant);
  }
}
