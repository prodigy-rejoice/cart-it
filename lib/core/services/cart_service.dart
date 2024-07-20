import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import '../../models/api_model.dart';

class CartService with ListenableServiceMixin {
  List<Product> cart = [];
  bool isLoading = true;

  static const String apiKey =
      '9713371a82c24374ab53094e6d7057cc20240713153049998114';
  static const String appId = '97W459JCOYHKQF6';
  static const String organizationId = 'b3cc8c67fa7049909c9b38033787792b';
  static const String baseUrl = "https://api.timbu.cloud/products";

  CartService() {
    initialize();
  }

  Future<void> initialize() async {
    fetchProducts();
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    const url =
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;

        Map<String, dynamic> jsonData = json.decode(data);
        if (jsonData.containsKey('items')) {
          List<dynamic> productData = jsonData['items'];
          List<Product> fetchedProducts =
              productData.map((value) => Product.fromJson(value)).toList();
          cart = fetchedProducts;
          isLoading = false;
          notifyListeners();
        } else {
          print('Unexpected JSON format: $jsonData');
        }
      } else {
        print('Failed to load products: ${response.statusCode}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
