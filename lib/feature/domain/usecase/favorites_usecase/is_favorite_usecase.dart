import '../../repository/favorites_repository.dart';

class IsFavoriteUseCase {
  final FavoritesRepository favoritesRepository;

  IsFavoriteUseCase({required this.favoritesRepository});

  Future<bool> call(String restaurantId) async {
    return await favoritesRepository.isFavorite(id: restaurantId);
  }
}
