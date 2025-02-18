// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String categoryId;
  final int? discount;
  final List<String> images;
  Product({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.categoryId,
    this.discount,
    required this.images,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? discount,
    String? categoryId,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
      discount: discount ?? this.discount,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category_id': categoryId,
      'discount': discount,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : map['price'],
      categoryId: map['category_id'] as String,
      discount: map['discount'] as int?,
      images: (map['productimages'] != null)
          ? List<String>.from((map['productimages'] as List<dynamic>)
              .map((img) => img['image_url'].toString()))
          : [], // Convert nested images properly
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, category: $categoryId, images: $images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.categoryId == categoryId &&
        other.discount == discount &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        categoryId.hashCode ^
        discount.hashCode ^
        images.hashCode;
  }
}
