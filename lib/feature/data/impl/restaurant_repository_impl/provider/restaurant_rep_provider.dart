import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/repository/restaurant_repository.dart';
import '../../../src/provider/data_src_provider.dart';
import '../restaurant_repository_impl.dart';

part 'restaurant_rep_provider.g.dart';

@riverpod
RestaurantRepository restaurantRepository(Ref ref) {
  return RestaurantRepositoryImpl(dataSrc: ref.read(dataSrcProvider));
}
