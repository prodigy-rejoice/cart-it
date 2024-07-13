import 'package:shop_sharrie/models/photo_model.dart';
import 'package:shop_sharrie/models/price_model.dart';

class Product {
  final String? name;
  final List<Photo>? photos;
  final List<Price>? currentPrice;
  final String? description;
  final String? uniqueId;

  Product({
    required this.name,
    required this.photos,
    required this.currentPrice,
    required this.description,
    required this.uniqueId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'],
        photos: (json["photos"] as List<dynamic>?)
            ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList(),
        currentPrice: (json["current_price"] as List<dynamic>?)
            ?.map((e) => Price.fromJson(e))
            .toList(),
        description: json["description"],
        uniqueId: json["unique_id"]);
  }
}
