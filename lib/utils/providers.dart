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
  bool _isExtraRequired = false;
  bool _isOnlyOneExtraSelectable = false;
  var _curIndex;
  bool _isAddableToCart = false;

  int get productCount => _productCount;

  List<ProductExtraItemInfo> get extraItems => _extraItems;

  int get totalPrice => _totalPrice;

  bool get isExtraRequired => _isExtraRequired;

  bool get isOnlyOneExtraSelectable => _isOnlyOneExtraSelectable;

  get curIndex => _curIndex;

  bool get isAddableToCart => _isAddableToCart;

  void setProductInfo({required ProductInfo productInfo}) {
    _productInfo = productInfo;
    _productCount = 1;
    _calcTotalPrice();
    _checkExtraRequired();
    _checkAddableToCart();
    notifyListeners();
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
      _extraItems.remove(itemInfo);
    } else {
      _extraItems.add(itemInfo);
    }
    _filterExtraItems();
    _calcTotalPrice();
    _checkAddableToCart();
    notifyListeners();
  }

  void selectExtraItem({required int index}) {
    ProductExtraItemInfo temp = _productInfo!.extra_items![index];
    if (_extraItems.contains(temp)) {
      return;
    }

    _curIndex = index;
    _extraItems.clear();
    _extraItems.add(temp);
    _calcTotalPrice();
    _checkAddableToCart();
    notifyListeners();
  }

  String getExtraSelectRange() {
    if (_productInfo == null) {
      return '';
    }
    int min = int.parse(_productInfo!.extras![0].min!);
    int max = int.parse(_productInfo!.extras![0].max!);
    if (min == max) {
      return min == 1 ? 'Please select $min item' : 'Please select $min items';
    } else if (min > 0) {
      return 'Please select $min ~ $max item(s)';
    }
    return 'Please select at most $max item(s)';
  }

  bool checkExtraItemSelected({required ProductExtraItemInfo itemInfo}) {
    return _extraItems.contains(itemInfo);
  }

  void _checkAddableToCart() {
    if (_productInfo == null) {
      return;
    }
    int min = int.parse(_productInfo!.extras![0].min!);
    int max = int.parse(_productInfo!.extras![0].max!);
    _isAddableToCart = _extraItems.length >= min && _extraItems.length <= max;
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

  void _checkExtraRequired() {
    if (_productInfo == null) {
      return;
    }
    int min = int.parse(_productInfo!.extras![0].min!);
    int max = int.parse(_productInfo!.extras![0].max!);
    _isExtraRequired = min > 0;
    if (min == max && min == 1) {
      _isOnlyOneExtraSelectable = true;
    }
  }
}
