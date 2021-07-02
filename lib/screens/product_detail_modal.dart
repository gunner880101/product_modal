import 'package:flutter/material.dart';
import 'package:product_modal/models/product_info.dart';
import 'package:product_modal/screens/components/product_info_widget.dart';
import 'package:product_modal/screens/components/product_order_widget.dart';
import 'package:product_modal/utils/providers.dart';
import 'package:product_modal/utils/size_config.dart';
import 'package:provider/provider.dart';

class ProductDetailModal extends StatefulWidget {
  final ProductInfo productInfo;
  const ProductDetailModal({Key? key, required this.productInfo})
      : super(key: key);

  @override
  _ProductDetailModalState createState() => _ProductDetailModalState();
}

class _ProductDetailModalState extends State<ProductDetailModal> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      Provider.of<ProductOrderManager>(context, listen: false)
          .setProductInfo(productInfo: widget.productInfo);
    });
  }

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
              ProductInfoWidget(
                productInfo: widget.productInfo,
              ),
              Expanded(
                flex: 1,
                child: ProductOrderWidget(
                  productInfo: widget.productInfo,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 60,
                  color: Color.fromARGB(200, 80, 40, 40),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 40,
                      ),
                      Consumer<ProductOrderManager>(
                        builder: (context, provider, _) {
                          return Text(
                            'ADD ${provider.productCount} TO CART',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          );
                        },
                      ),
                      Consumer<ProductOrderManager>(
                        builder: (context, provider, _) {
                          return Text(
                            '${provider.totalPrice}',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          );
                        },
                      ),
                    ],
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
