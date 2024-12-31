// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:e_commerce/domain/models/Seller.dart';
import 'package:e_commerce/domain/models/category.dart';

class Product {
  String id;
  String name;
  String description;
  double price;
  int stock;
  CategoryProduct category;
  Seller seller;
  List<String> images;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.seller,
    required this.images,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? stock,
    CategoryProduct? category,
    Seller? seller,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      category: category ?? this.category,
      seller: seller ?? this.seller,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'category': category.toMap(),
      'seller': seller.toMap(),
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      stock: map['stock'] as int,
      category: CategoryProduct.fromMap(map['category'] as Map<String,dynamic>),
      seller: Seller.fromMap(map['seller'] as Map<String,dynamic>),
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, stock: $stock, category: $category, seller: $seller, images: $images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.stock == stock &&
      other.category == category &&
      other.seller == seller &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      stock.hashCode ^
      category.hashCode ^
      seller.hashCode ^
      images.hashCode;
  }
}
