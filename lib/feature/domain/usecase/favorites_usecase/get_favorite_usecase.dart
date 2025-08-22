import '../../../data/model/restaurant/restaurant_model.dart';
import '../../repository/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository favoritesRepository;

  GetFavoritesUseCase({required this.favoritesRepository});

  Future<List<RestaurantModel>> call() async {
    return await favoritesRepository.getFavoriteRestaurants();
  }
}
