import 'package:flutter/material.dart';
import 'package:product_modal/models/product_extra_item_info.dart';
import 'package:product_modal/utils/providers.dart';
import 'package:provider/provider.dart';

class ProductExtraItem extends StatefulWidget {
  final ProductExtraItemInfo extraItemInfo;
  final int index;
  const ProductExtraItem(
      {Key? key, required this.extraItemInfo, required this.index})
      : super(key: key);

  @override
  _ProductExtraItemState createState() => _ProductExtraItemState();
}

class _ProductExtraItemState extends State<ProductExtraItem> {
  @override
  Widget build(BuildContext context) {
    String? nameCaption = int.parse(widget.extraItemInfo.price!) > 0
        ? '${widget.extraItemInfo.name} (${widget.extraItemInfo.price})'
        : widget.extraItemInfo.name;

    return Consumer<ProductOrderManager>(
      builder: (context, provider, _) {
        return !provider.isOnlyOneExtraSelectable
            ? CheckboxListTile(
                title: Text(
                  nameCaption!,
                  style: TextStyle(fontSize: 24),
                ),
                onChanged: (bool? value) => onCheckItemSelected(),
                value: provider.checkExtraItemSelected(
                    itemInfo: widget.extraItemInfo),
              )
            : RadioListTile(
                title: Text(
                  nameCaption!,
                  style: TextStyle(fontSize: 24),
                ),
                onChanged: (val) => onRadioItemSelected(val),
                value: widget.index,
                groupValue: provider.curIndex,
              );
      },
    );
  }

  void onCheckItemSelected() {
    Provider.of<ProductOrderManager>(context, listen: false)
        .addExtraItem(itemInfo: widget.extraItemInfo);
  }

  void onRadioItemSelected(var index) {
    Provider.of<ProductOrderManager>(context, listen: false)
        .selectExtraItem(index: index);
  }
}
