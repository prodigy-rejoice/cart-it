import 'package:shop_sharrie/app/app.locator.dart';
import 'package:shop_sharrie/core/services/item_services.dart';
import 'package:shop_sharrie/models/api_model.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsViewModel extends ReactiveViewModel {
  final _cartService = locator<ItemService>();
  final Product product;

  ProductDetailsViewModel(this.product);

  @override
  List<ListenableServiceMixin> get listenableServices => [_cartService];

  int get count => _cartService.getCount(product);

  String? get price =>
      (product.currentPrice?.first.USD?.first)?.toStringAsFixed(2);

  void increment() {
    _cartService.addItemToCart(product);
  }

  void decrement() {
    _cartService.removeItemToCart(product);
  }
}
