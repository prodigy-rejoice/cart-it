import 'package:shop_sharrie/app/app.locator.dart';
import 'package:shop_sharrie/core/services/cart_service.dart';
import 'package:stacked/stacked.dart';

import '../../models/api_model.dart';

class HomeScreenViewModel extends ReactiveViewModel {
  final CartService _cartService = locator<CartService>();

  int currentIndex = 0;

  int get productsCount => _cartService.cart.length;
  List<Product> get products => _cartService.cart;

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];

  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
