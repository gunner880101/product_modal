import 'package:json_annotation/json_annotation.dart';
import 'package:product_modal/models/product_category_info.dart';
import 'package:product_modal/models/product_extra_info.dart';
import 'package:product_modal/models/product_extra_item_info.dart';
import 'package:product_modal/models/product_image_info.dart';

part 'product_info.g.dart';

@JsonSerializable()
class ProductInfo {
  int? id;
  String? name;
  int? price;
  int? before_sale_price;
  String? description;
  String? full_description;
  int? order;
  ProductCategoryInfo? category;
  ProductImageInfo? images;
  List<ProductExtraInfo>? extras;
  List<ProductExtraItemInfo>? extra_items;
  List<String>? tags;
  String? availability;

  ProductInfo(
      this.id,
      this.name,
      this.price,
      this.before_sale_price,
      this.description,
      this.full_description,
      this.order,
      this.category,
      this.images,
      this.extras,
      this.extra_items,
      this.tags,
      this.availability);

  factory ProductInfo.fromJson(Map<String, dynamic> parsedJson) =>
      _$ProductInfoFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);
}
