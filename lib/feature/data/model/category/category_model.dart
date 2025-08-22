import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default('') String alias,
    @Default('') String title,
    @Default(false) bool isSelected,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryColorX on CategoryModel {
  Color get color {
    switch (alias) {
      case "italian":
        return Colors.redAccent;
      case "japanese":
        return Colors.indigo;
      case "mexican":
        return Colors.orange;
      case "indian":
        return Colors.deepPurple;
      case "chinese":
        return Colors.green;
      default:
        final hash = alias.hashCode;
        final r = (hash & 0xFF0000) >> 16;
        final g = (hash & 0x00FF00) >> 8;
        final b = (hash & 0x0000FF);
        return Color.fromARGB(255, r, g, b).withAlpha(178);
    }
  }
}