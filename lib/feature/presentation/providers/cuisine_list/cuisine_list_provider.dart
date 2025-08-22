import 'package:restaurant_roulette/feature/data/model/category/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cuisine_list_provider.g.dart';

@riverpod
class CuisineList extends _$CuisineList {
  @override
  List<CategoryModel> build() {
    return availableCuisines;
  }

  void toggleSelected(CategoryModel cuisine) {
    state = [
      for (final item in state)
        if (item.alias == cuisine.alias)
          CategoryModel(
            title: item.title,
            alias: item.alias,
            isSelected: !item.isSelected,
          )
        else
          CategoryModel(
            title: item.title,
            alias: item.alias,
            isSelected: false,
          ),
    ];
  }
}

List<CategoryModel> availableCuisines = [
  CategoryModel(title: "American", alias: "american"),
  CategoryModel(title: "Italian", alias: "italian"),
  CategoryModel(title: "Mexican", alias: "mexican"),
  CategoryModel(title: "Japanese", alias: "japanese"),
  CategoryModel(title: "Chinese", alias: "chinese"),
  CategoryModel(title: "Indian", alias: "indian"),
  CategoryModel(title: "Thai", alias: "thai"),
  CategoryModel(title: "French", alias: "french"),
  CategoryModel(title: "Pizza", alias: "pizza"),
  CategoryModel(title: "Burgers", alias: "burgers"),
  CategoryModel(title: "Seafood", alias: "seafood"),
  CategoryModel(title: "Vegetarian", alias: "vegetarian"),
  CategoryModel(title: "Vegan", alias: "vegan"),
  CategoryModel(title: "Breakfast & Brunch", alias: "breakfast_brunch"),
  CategoryModel(title: "Fast Food", alias: "fastfood"),
];
