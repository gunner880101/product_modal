import 'package:flutter/material.dart';
import 'package:product_modal/models/product_extra_item_info.dart';

class ProductExtraItemWidget extends StatefulWidget {
  final ProductExtraItemInfo extraItemInfo;
  const ProductExtraItemWidget({Key? key, required this.extraItemInfo})
      : super(key: key);

  @override
  _ProductExtraItemWidgetState createState() => _ProductExtraItemWidgetState();
}

class _ProductExtraItemWidgetState extends State<ProductExtraItemWidget> {
  @override
  Widget build(BuildContext context) {
    String? nameCaption = int.parse(widget.extraItemInfo.price!) > 0
        ? '${widget.extraItemInfo.name} (${widget.extraItemInfo.price})'
        : widget.extraItemInfo.name;

    return GestureDetector(
      onTap: () {
        print('extra item: ${widget.extraItemInfo.name}');
      },
      child: ListTile(
          title: Text(
        nameCaption!,
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}
