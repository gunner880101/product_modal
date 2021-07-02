import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                child: Consumer<ProductOrderManager>(
                  builder: (context, provider, _) {
                    return GestureDetector(
                      onTap: () {
                        if (!provider.isAddableToCart) {
                          return;
                        }
                        Fluttertoast.showToast(
                            msg: "Successfully added to cart!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            fontSize: 16.0);
                      },
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: 60,
                        color: provider.isAddableToCart
                            ? Color.fromARGB(200, 80, 40, 40)
                            : Color.fromARGB(50, 80, 40, 40),
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
                            Text(
                              'ADD ${provider.productCount} TO CART',
                              style:
                                  TextStyle(fontSize: 32, color: Colors.white),
                            ),
                            Text(
                              '${provider.totalPrice}',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
          Positioned(
              top: SizeConfig().getHeight(10),
              left: SizeConfig().getHeight(10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(CircleBorder()),
                    minimumSize: MaterialStateProperty.all(Size(40, 40)),
                    shadowColor: MaterialStateProperty.all(
                        Colors.black26.withOpacity(.32)),
                  ),
                  onPressed: () {
                    Navigator.pop(context, '');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black26,
                  )))
        ],
      ),
    );
  }
}
