// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      alias: json['alias'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'title': instance.title,
      'isSelected': instance.isSelected,
    };
