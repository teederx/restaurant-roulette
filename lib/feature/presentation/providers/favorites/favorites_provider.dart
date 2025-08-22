import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/impl/favorites_service_impl/provider/favorites_service_provider.dart';
import '../../../data/model/restaurant/restaurant_model.dart';
import '../../../domain/repository/favorites_repository.dart';
import '../../../domain/usecase/favorites_usecase/add_favourite_usecase.dart';
import '../../../domain/usecase/favorites_usecase/get_favorite_usecase.dart';
import '../../../domain/usecase/favorites_usecase/is_favorite_usecase.dart';
import '../../../domain/usecase/favorites_usecase/remove_favorite_usecase.dart';

part 'favorites_provider.g.dart';

@riverpod
class Favorites extends _$Favorites {
  late final FavoritesRepository _favoritesRepo;

  @override
  FutureOr<List<RestaurantModel>> build() {
    _favoritesRepo = ref.read(favoritesServiceProvider);

    // trigger initial load
    _loadFavorites();

    // return empty list until _loadFavorites finishes
    return [];
  }

  Future<void> _loadFavorites() async {
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(() async {
      final getFavoritesUsecase = GetFavoritesUseCase(
        favoritesRepository: _favoritesRepo,
      );
      return await getFavoritesUsecase.call();
    });

    if (ref.mounted) {
      state = result;
    }
  }

  Future<void> addFavorite({required RestaurantModel restaurant}) async {
    final result = await AsyncValue.guard(() async {
      final addUsecase = AddFavoriteUseCase(
        favoritesRepository: _favoritesRepo,
      );
      await addUsecase.call(restaurant);
      return await _getFavorites();
    });

    if (ref.mounted) state = result;
  }

  Future<void> removeFavorite({required String restaurantId}) async {
    final result = await AsyncValue.guard(() async {
      final removeUsecase = RemoveFavoriteUseCase(
        favoritesRepository: _favoritesRepo,
      );
      await removeUsecase.call(restaurantId);
      return await _getFavorites();
    });

    if (ref.mounted) state = result;
  }

  Future<void> toggleFavorite({required RestaurantModel restaurant}) async {
    final result = await AsyncValue.guard(() async {
      final isFavoriteUsecase = IsFavoriteUseCase(
        favoritesRepository: _favoritesRepo,
      );
      final isFavorite = await isFavoriteUsecase.call(restaurant.id);

      if (isFavorite) {
        final removeUsecase = RemoveFavoriteUseCase(
          favoritesRepository: _favoritesRepo,
        );
        await removeUsecase.call(restaurant.id);
      } else {
        final addUsecase = AddFavoriteUseCase(
          favoritesRepository: _favoritesRepo,
        );
        await addUsecase.call(restaurant);
      }

      return await _getFavorites();
    });

    if (ref.mounted) state = result;
  }

  Future<List<RestaurantModel>> _getFavorites() async {
    final getFavoritesUsecase = GetFavoritesUseCase(
      favoritesRepository: _favoritesRepo,
    );
    return await getFavoritesUsecase.call();
  }
}
