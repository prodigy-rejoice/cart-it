import 'package:shop_sharrie/core/services/item_services.dart';
import 'package:shop_sharrie/models/api_model.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';

class CartViewModel extends ReactiveViewModel {
  final _cartService = locator<ItemService>();

  int get count {
    return _cartService.itemCount;
  }

  int get itemLength {
    return _cartService.items.length;
  }

  int get totalCount {
    return _cartService.itemCount;
  }

  List<Product> get cart {
    return _cartService.items.toSet().toList();
  }

  double get totalPrice {
    return _cartService.items
        .fold(0, (sum, item) => sum + item.currentPrice?.first.USD?.first);
  }

  void increment(Product product) {
    _cartService.addItemToCart(product);
  }

  void decrement(Product product) {
    _cartService.removeItemToCart(product);
  }

  void addToCart(Product product) {
    _cartService.addItemToCart(product);
    notifyListeners();
  }

  void deleteItem(Product product) {
    _cartService.deleteItemInCart(product);
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];

  int getCount(product) {
    return _cartService.getCount(product);
  }
}
