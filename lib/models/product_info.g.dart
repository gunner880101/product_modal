// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) {
  return ProductInfo(
    json['id'] as int?,
    json['name'] as String?,
    json['price'] as int?,
    json['before_sale_price'] as int?,
    json['description'] as String?,
    json['full_description'] as String?,
    json['order'] as int?,
    json['category'] == null
        ? null
        : ProductCategoryInfo.fromJson(
            json['category'] as Map<String, dynamic>),
    json['images'] == null
        ? null
        : ProductImageInfo.fromJson(json['images'] as Map<String, dynamic>),
    (json['extras'] as List<dynamic>?)
        ?.map((e) => ProductExtraInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['extra_items'] as List<dynamic>?)
        ?.map((e) => ProductExtraItemInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['availability'] as String?,
  );
}

Map<String, dynamic> _$ProductInfoToJson(ProductInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'before_sale_price': instance.before_sale_price,
      'description': instance.description,
      'full_description': instance.full_description,
      'order': instance.order,
      'category': instance.category,
      'images': instance.images,
      'extras': instance.extras,
      'extra_items': instance.extra_items,
      'tags': instance.tags,
      'availability': instance.availability,
    };
