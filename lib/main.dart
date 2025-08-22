import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'feature/data/model/category/category_model_adapter.dart';
import 'feature/data/model/location/location_model_adapter.dart';
import 'feature/data/model/restaurant/restaurant_model.dart';
import 'feature/data/model/restaurant/restaurant_model_adapter.dart';
import 'feature/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();

  Hive.registerAdapter(RestaurantModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(LocationModelAdapter());

  await Hive.openBox<RestaurantModel>('favoritesBox');

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Roulette',
          initialRoute: Home.routeName,

          routes: {Home.routeName: (context) => const Home()},
        );
      },
    );
  }
}
