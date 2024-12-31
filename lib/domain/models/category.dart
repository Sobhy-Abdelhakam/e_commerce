// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryProduct {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final String createdAt;
  CategoryProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  CategoryProduct copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? createdAt,
  }) {
    return CategoryProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'created_at': createdAt,
    };
  }

  factory CategoryProduct.fromMap(Map<String, dynamic> map) {
    return CategoryProduct(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String?,
      imageUrl: map['image_url'] as String?,
      createdAt: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryProduct.fromJson(String source) => CategoryProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description, image_url: $imageUrl, created_at: $createdAt)';
  }
}
