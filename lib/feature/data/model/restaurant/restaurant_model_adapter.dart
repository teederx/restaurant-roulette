import 'package:hive_flutter/hive_flutter.dart';

import '../category/category_model.dart';
import '../location/location_model.dart';
import 'restaurant_model.dart';

class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
  @override
  final int typeId = 1;

  @override
  RestaurantModel read(BinaryReader reader) {
    final id = reader.readString();
    final name = reader.readString();
    final url = reader.readString();

    final categories = (reader.readList())
        .cast<CategoryModel>();

    final location = reader.read() as LocationModel;

    final imageUrl = reader.readString();
    final reviewCount = reader.readInt();
    final rating = reader.readDouble();
    final price = reader.readString();

    final photos = (reader.readList()).cast<String>();

    final isFavorite = reader.readBool();

    return RestaurantModel(
      id: id,
      name: name,
      url: url,
      categories: categories,
      location: location,
      imageUrl: imageUrl,
      reviewCount: reviewCount,
      rating: rating,
      price: price,
      photos: photos,
      isFavorite: isFavorite,
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.url);

    writer.writeList(obj.categories);
    writer.write(obj.location);

    writer.writeString(obj.imageUrl);
    writer.writeInt(obj.reviewCount);
    writer.writeDouble(obj.rating);
    writer.writeString(obj.price);

    writer.writeList(obj.photos);
    writer.writeBool(obj.isFavorite);
  }
}
