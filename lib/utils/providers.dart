import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:product_modal/models/product_info.dart';

class ProductInfoLoadNotifier with ChangeNotifier {
  ProductInfo? _productInfo;
  bool? _isProductLoaded;

  ProductInfo? get productInfo => _productInfo;
  bool? get isProductLoaded => _isProductLoaded;

  void loadData({required BuildContext context}) {
    if (_isProductLoaded == true) {
      return;
    }
    Future<String> loadString = DefaultAssetBundle.of(context)
        .loadString("assets/json/product_mockup.json");
    loadString.then((value) {
      var temp = json.decode(value);
      _productInfo = ProductInfo.fromJson(temp);
      _isProductLoaded = true;
      notifyListeners();
    });
  }
}
