import 'package:json_annotation/json_annotation.dart';

part 'product_extra_info.g.dart';

@JsonSerializable()
class ProductExtraInfo {
  int? id;
  String? name;
  String? min;
  String? max;

  ProductExtraInfo(this.id, this.name, this.min, this.max);

  factory ProductExtraInfo.fromJson(Map<String, dynamic> parsedJson) =>
      _$ProductExtraInfoFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ProductExtraInfoToJson(this);
}
