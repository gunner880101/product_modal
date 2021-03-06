import 'package:flutter/material.dart';
import 'package:product_modal/models/product_info.dart';
import 'package:product_modal/screens/components/product_cout_update_button.dart';
import 'package:product_modal/screens/components/product_extra_item.dart';
import 'package:product_modal/utils/enum_util.dart';
import 'package:product_modal/utils/providers.dart';
import 'package:product_modal/utils/size_config.dart';
import 'package:provider/provider.dart';

class ProductOrderWidget extends StatefulWidget {
  final ProductInfo productInfo;
  const ProductOrderWidget({Key? key, required this.productInfo})
      : super(key: key);

  @override
  _ProductOrderWidgetState createState() => _ProductOrderWidgetState();
}

class _ProductOrderWidgetState extends State<ProductOrderWidget> {
  @override
  Widget build(BuildContext context) {
    var orderProvider =
        Provider.of<ProductOrderManager>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
          ),
          padding: EdgeInsets.all(SizeConfig().getHeight(16)),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${widget.productInfo.price}',
                  style: TextStyle(fontSize: SizeConfig().getHeight(20)),
                ),
              ),
              ProductCountUpdateButton(buttonType: CountButtonType.remove),
              Consumer<ProductOrderManager>(
                builder: (context, provider, _) {
                  return Container(
                    constraints:
                        BoxConstraints(minWidth: SizeConfig().getHeight(60)),
                    child: Text(
                      '${provider.productCount}',
                      style: TextStyle(fontSize: SizeConfig().getHeight(20)),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              ProductCountUpdateButton(buttonType: CountButtonType.add),
            ],
          ),
        ),
        Container(
          color: Colors.brown.withOpacity(0.3),
          padding: EdgeInsets.all(SizeConfig().getHeight(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.productInfo.extras![0].name!,
                style: TextStyle(fontSize: SizeConfig().getHeight(18)),
              ),
              SizedBox(
                width: SizeConfig().getHeight(12),
              ),
              Consumer<ProductOrderManager>(
                builder: (context, provider, _) {
                  return Text(
                    provider.isExtraRequired ? '(REQUIRED)' : '(OPTIONAL)',
                    style: TextStyle(
                        fontSize: SizeConfig().getHeight(16),
                        color: Colors.black45),
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          width: SizeConfig.screenWidth,
          color: Colors.brown.withOpacity(0.4),
          padding: EdgeInsets.all(SizeConfig().getHeight(6)),
          child: Consumer<ProductOrderManager>(builder: (context, provider, _) {
            return Text(
              orderProvider.getExtraSelectRange(),
              style: TextStyle(fontSize: SizeConfig().getHeight(10)),
              textAlign: TextAlign.start,
            );
          }),
        ),
        Expanded(
          child: Container(
            child: ListView.separated(
              itemCount: widget.productInfo.extra_items!.length,
              itemBuilder: (context, index) {
                return ProductExtraItem(
                    index: index,
                    extraItemInfo: widget.productInfo.extra_items![index]);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        )
      ],
    );
  }
}
