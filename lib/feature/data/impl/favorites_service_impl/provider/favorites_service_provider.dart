import 'package:restaurant_roulette/feature/domain/repository/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../favorites_service_impl.dart';

part 'favorites_service_provider.g.dart';

@riverpod
FavoritesRepository favoritesService(Ref ref) {
  return FavoritesServiceImpl();
}