import 'package:json_annotation/json_annotation.dart';

part 'product_extra_item_info.g.dart';

@JsonSerializable()
class ProductExtraItemInfo {
  int? id;
  String? name;
  int? extra_id;
  String? price;

  ProductExtraItemInfo(this.id, this.name, this.extra_id, this.price);

  factory ProductExtraItemInfo.fromJson(Map<String, dynamic> parsedJson) =>
      _$ProductExtraItemInfoFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ProductExtraItemInfoToJson(this);
}
