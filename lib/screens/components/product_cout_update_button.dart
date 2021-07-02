import 'package:flutter/material.dart';
import 'package:product_modal/utils/enum_util.dart';
import 'package:product_modal/utils/providers.dart';
import 'package:provider/provider.dart';

class ProductCountUpdateButton extends StatefulWidget {
  final CountButtonType buttonType;

  const ProductCountUpdateButton({Key? key, required this.buttonType})
      : super(key: key);

  @override
  _ProductCountUpdateButtonState createState() =>
      _ProductCountUpdateButtonState();
}

class _ProductCountUpdateButtonState extends State<ProductCountUpdateButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductOrderManager>(
      builder: (context, provider, _) {
        return GestureDetector(
            onTap: () {
              if (widget.buttonType == CountButtonType.remove &&
                  provider.productCount == 1) {
                return;
              }
              provider.updateProductCount(
                  count: widget.buttonType == CountButtonType.remove ? -1 : 1);
            },
            child: Icon(
              widget.buttonType == CountButtonType.remove
                  ? Icons.remove_circle
                  : Icons.add_circle,
              color: widget.buttonType == CountButtonType.remove &&
                      provider.productCount == 1
                  ? Colors.brown.withOpacity(0.4)
                  : Colors.brown,
              size: 32,
            ));
      },
    );
  }
}
