import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:product_modal/models/product_extra_item_info.dart';
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

class ProductOrderManager with ChangeNotifier {
  ProductInfo? _productInfo;
  int _productCount = 0;
  List<ProductExtraItemInfo> _extraItems = [];
  int _totalPrice = 0;

  int get productCount => _productCount;

  List<ProductExtraItemInfo> get extraItems => _extraItems;

  int get totalPrice => _totalPrice;

  void setProductInfo({required ProductInfo productInfo}) {
    _productInfo = productInfo;
  }

  void updateProductCount({required int count}) {
    if (count != 1 && count != -1) {
      return;
    }

    _productCount += count;
    _calcTotalPrice();
    notifyListeners();
  }

  void addExtraItem({required ProductExtraItemInfo itemInfo}) {
    if (_extraItems.contains(itemInfo)) {
      return;
    }
    _extraItems.add(itemInfo);
    _filterExtraItems();
    _calcTotalPrice();
    notifyListeners();
  }

  void _calcTotalPrice() {
    if (_productInfo == null) {
      _totalPrice = 0;
    }
    _totalPrice = 0;
    _totalPrice = _productCount * _productInfo!.price!;
    _extraItems.forEach((item) {
      _totalPrice += int.parse(item.price!) * _productCount;
    });
  }

  void _filterExtraItems() {
    if (_extraItems.length > int.parse(_productInfo!.extras![0].max!)) {
      _extraItems.removeAt(0);
    }
  }
}
