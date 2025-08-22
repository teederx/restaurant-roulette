import '../../repository/favorites_repository.dart';

class RemoveFavoriteUseCase {
  final FavoritesRepository favoritesRepository;

  RemoveFavoriteUseCase({required this.favoritesRepository});

  Future<void> call(String favoriteId) async {
    return await favoritesRepository.removeFavoriteRestaurant(
      restaurantId: favoriteId,
    );
  }
}
