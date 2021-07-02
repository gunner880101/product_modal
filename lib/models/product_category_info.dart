import 'package:json_annotation/json_annotation.dart';

part 'product_category_info.g.dart';

@JsonSerializable()
class ProductCategoryInfo {
  int? id;
  String? name;

  ProductCategoryInfo(this.id, this.name);

  factory ProductCategoryInfo.fromJson(Map<String, dynamic> parsedJson) =>
      _$ProductCategoryInfoFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ProductCategoryInfoToJson(this);
}
