import 'package:flutter/foundation.dart';
import 'package:shop_sharrie/models/photo_model.dart';
import 'package:shop_sharrie/models/price_model.dart';

class Product {
  final String? name;
  final List<Photo>? photos;
  final List<Price>? currentPrice;
  final String? description;
  final String? uniqueId;
  final String? categoryId;
  final List<Category>? categories;

  Product({
    this.categoryId,
    this.name,
    this.photos,
    this.currentPrice,
    this.description,
    this.uniqueId,
    this.categories
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        categoryId: json['category_id'],
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          uniqueId == other.uniqueId;
}
