import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/impl/restaurant_repository_impl/provider/restaurant_rep_provider.dart';
import '../../../data/model/restaurant/restaurant_model.dart';
import '../../../domain/repository/restaurant_repository.dart';
import '../../../domain/usecase/fetch_restaurants_usecase.dart';
import '../favorites/favorites_provider.dart';

part 'fetch_restaurants_provider.g.dart';

@riverpod
class FetchRestaurants extends _$FetchRestaurants {
  bool _disposed = false;

  @override
  FutureOr<List<RestaurantModel>> build() {
    ref.onDispose(() {
      _disposed = true;
    });
    return [];
  }

  Future<void> fetchRestaurants({
    required String term,
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    state = const AsyncValue.loading();
    final RestaurantRepository restaurantRepo = ref.read(
      restaurantRepositoryProvider,
    );
    final fetchRestaurantsUsecase = FetchRestaurantsUsecase(
      repository: restaurantRepo,
    );

    final result = await AsyncValue.guard(() async {
      return await fetchRestaurantsUsecase.call(
        term: term,
        location: location,
        latitude: latitude,
        longitude: longitude,
      );
    });
    // print(result);

    if (!_disposed) {
      state = result;
    } else {
      state = const AsyncValue.data([]);
    }
  }

  Future<void> toggleFavorite(String restaurantId) async {
    if (_disposed) return;

    final currentState = state;
    if (currentState is AsyncData<List<RestaurantModel>>) {
      final restaurant = currentState.value.firstWhere(
        (r) => r.id == restaurantId,
      );

      await ref
          .read(favoritesProvider.notifier)
          .toggleFavorite(restaurant: restaurant);

      final updatedRestaurants =
          currentState.value.map((r) {
            if (r.id == restaurantId) {
              return r.copyWith(isFavorite: !r.isFavorite);
            }
            return r;
          }).toList();

      state = AsyncValue.data(updatedRestaurants);
    }
  }
}
