import 'package:json_annotation/json_annotation.dart';

part 'product_image_info.g.dart';

@JsonSerializable()
class ProductImageInfo {
  String? full_size;
  String? thumbnail;

  ProductImageInfo(this.full_size, this.thumbnail);

  factory ProductImageInfo.fromJson(Map<String, dynamic> parsedJson) =>
      _$ProductImageInfoFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ProductImageInfoToJson(this);
}
