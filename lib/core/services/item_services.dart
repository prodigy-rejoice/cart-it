import 'package:stacked/stacked.dart';
import '../../models/api_model.dart';

class ItemService with ListenableServiceMixin {
  List<Product> items = [];

  int get itemCount => items.length;

  void addItemToCart(Product product) {
    items.add(product);
    notifyListeners();
  }

  void removeItemToCart(Product product) {
    items.remove(product);
    notifyListeners();
  }

  void deleteItemInCart(Product product) {
    items.removeWhere((element) => element.uniqueId == product.uniqueId);
    notifyListeners();
  }

  int getCount(Product product) {
    return items.where((e) => e.uniqueId == product.uniqueId).length;
  }
}
