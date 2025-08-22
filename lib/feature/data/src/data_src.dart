import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/restaurant/restaurant_model.dart';

const int limit = 10;

class DataSrc {
  final Dio _dio;

  DataSrc()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.yelp.com/v3',
          headers: {'Authorization': 'Bearer ${dotenv.env['API_KEY'] as String}'},
        ),
      );

  Future<List<RestaurantModel>> searchRestaurants({
    required String term,
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    final queryParams = {
      'term': term,
      'limit': limit,
      'categories': 'restaurants',
      if (location != null) 'location': location,
      if (latitude != null && longitude != null) ...{
        'latitude': latitude,
        'longitude': longitude,
      },
    };

    final response = await _dio.get(
      '/businesses/search',
      queryParameters: queryParams,
    );

    final List businesses = response.data['businesses'];
    return businesses.map((e) => RestaurantModel.fromJson(e)).toList();
  }
}
