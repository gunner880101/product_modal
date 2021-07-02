import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_modal/models/product_info.dart';
import 'package:product_modal/screens/components/product_extra_item_widget.dart';
import 'package:product_modal/utils/size_config.dart';

class ProductDetailModal extends StatefulWidget {
  final ProductInfo? productInfo;
  const ProductDetailModal({Key? key, required this.productInfo})
      : super(key: key);

  @override
  _ProductDetailModalState createState() => _ProductDetailModalState();
}

class _ProductDetailModalState extends State<ProductDetailModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Stack(
        children: [
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  imageUrl: widget.productInfo!.images!.full_size!,
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.productInfo!.name!,
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.productInfo!.full_description!,
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.productInfo!.price}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Icon(
                      Icons.remove_circle,
                      color: Colors.brown,
                      size: 32,
                    ),
                    Container(
                      constraints: BoxConstraints(minWidth: 80),
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(
                      Icons.add_circle,
                      color: Colors.brown,
                      size: 32,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.brown.withOpacity(0.3),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.productInfo!.extras![0].name!,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      '(REQUIRED)',
                      style: TextStyle(fontSize: 24, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              Container(
                width: SizeConfig.screenWidth,
                color: Colors.brown.withOpacity(0.4),
                padding: EdgeInsets.all(16),
                child: Text(
                  'Please select 1 item',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: ListView.separated(
                    itemCount: widget.productInfo!.extra_items!.length,
                    itemBuilder: (context, index) {
                      return ProductExtraItemWidget(
                          extraItemInfo:
                              widget.productInfo!.extra_items![index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
