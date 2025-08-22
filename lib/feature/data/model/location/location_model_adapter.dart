import 'package:hive/hive.dart';
import 'location_model.dart';

class LocationModelAdapter extends TypeAdapter<LocationModel> {
  @override
  final int typeId = 3; // make sure it's unique

  @override
  LocationModel read(BinaryReader reader) {
    final displayAddress = (reader.readList()).cast<String>();
    return LocationModel(displayAddress: displayAddress);
  }

  @override
  void write(BinaryWriter writer, LocationModel obj) {
    writer.writeList(obj.displayAddress);
  }
}
