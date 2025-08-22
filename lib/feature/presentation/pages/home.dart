import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_roulette/feature/presentation/pages/widgets/favorites_tab/favorites_tab.dart';
import 'package:restaurant_roulette/feature/presentation/pages/widgets/spin_wheel_tab/spin_wheel_tab.dart';

import '../providers/favorites/favorites_provider.dart';
import '../providers/fetch_restaurants/fetch_restaurants_provider.dart';
import 'widgets/custom_tab_bar.dart';
import 'widgets/custom_title_bar.dart';
import 'widgets/home_tab/home_tab.dart';

class Home extends ConsumerWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchRestaurantState = ref.watch(fetchRestaurantsProvider);
    final favoriteRestaurantState = ref.watch(favoritesProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              // Custom TitleBar
              CustomTitleBar(),

              // Tab bar
              CustomTabBar(),

              // Tab views
              Expanded(
                child: TabBarView(
                  children: [
                    //Home content
                    HomeTab(),
                    //Spin wheel content
                    SpinWheelTab(fetchRestaurantState: fetchRestaurantState),

                    //Favorites content
                    FavoritesTab(favoriteRestaurantState: favoriteRestaurantState,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
