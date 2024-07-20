import 'package:shop_sharrie/core/services/cart_service.dart';
import 'package:shop_sharrie/core/services/item_services.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [],
  dependencies: [
    LazySingleton(classType: CartService),
    LazySingleton(classType: ItemService)
  ],
)
class AppSetup {}
