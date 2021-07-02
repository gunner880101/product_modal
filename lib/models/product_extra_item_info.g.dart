// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_extra_item_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductExtraItemInfo _$ProductExtraItemInfoFromJson(Map<String, dynamic> json) {
  return ProductExtraItemInfo(
    json['id'] as int?,
    json['name'] as String?,
    json['extra_id'] as int?,
    json['price'] as String?,
  );
}

Map<String, dynamic> _$ProductExtraItemInfoToJson(
        ProductExtraItemInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'extra_id': instance.extra_id,
      'price': instance.price,
    };
