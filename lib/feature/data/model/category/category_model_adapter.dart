import 'package:hive/hive.dart';
import 'category_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 2; 

  @override
  CategoryModel read(BinaryReader reader) {
    final alias = reader.readString();
    final title = reader.readString();
    final isSelected = reader.readBool();

    return CategoryModel(
      alias: alias,
      title: title,
      isSelected: isSelected,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.writeString(obj.alias);
    writer.writeString(obj.title);
    writer.writeBool(obj.isSelected);
  }
}
