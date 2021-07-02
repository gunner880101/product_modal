// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_extra_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExtraInfo _$ProductExtraInfoFromJson(Map<String, dynamic> json) {
  return ProductExtraInfo(
    json['id'] as int?,
    json['name'] as String?,
    json['min'] as String?,
    json['max'] as String?,
  );
}

Map<String, dynamic> _$ProductExtraInfoToJson(ProductExtraInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'min': instance.min,
      'max': instance.max,
    };
