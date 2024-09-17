import 'package:flutter/cupertino.dart';

import 'Product_modile.dart';

class Like extends ChangeNotifier {
  List<DataModel> _items = [];
  double _totalPrice = 0.0;

  void add(DataModel item) {
    _items.add(item);
    _totalPrice += item.price ;
    notifyListeners();
  }

  void remove(DataModel item) {
    _items.remove(item);
    _totalPrice -= item.price ;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<DataModel> get basketItems {
    return _items;
  }
}
