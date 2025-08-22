import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_roulette/feature/presentation/providers/favorites/favorites_provider.dart';

import '../../../../data/model/restaurant/restaurant_model.dart';
import '../spin_wheel_tab/restaurant_tile.dart';
import '../spin_wheel_tab/tile_animation.dart';

class FavoritesTab extends ConsumerWidget {
  const FavoritesTab({super.key, required this.favoriteRestaurantState});

  final AsyncValue<List<RestaurantModel>> favoriteRestaurantState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return favoriteRestaurantState.when(
      data: (favoriteRestaurants) {
        if (favoriteRestaurants.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 48.sp,
                  color: Colors.grey.shade400,
                ),
                10.verticalSpace,
                Text(
                  'No favorite restaurants yet',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
          itemCount: favoriteRestaurants.length,
          itemBuilder: (context, index) {
            final restaurant = favoriteRestaurants[index];
            return TilesAnimation(
              index: index,
              child: RestaurantTile(
                restaurant: restaurant,
                type: 2,
                onFavoriteToggle:
                    () => ref
                        .read(favoritesProvider.notifier)
                        .toggleFavorite(restaurant: restaurant),
              ),
            );
          },
          separatorBuilder:
              (BuildContext context, int index) => 10.verticalSpace,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
