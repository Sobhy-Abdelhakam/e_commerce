// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryProduct {
  String id;
  String name;
  String description;
  String image_url;
  String created_at;
  CategoryProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.image_url,
    required this.created_at,
  });

  CategoryProduct copyWith({
    String? id,
    String? name,
    String? description,
    String? image_url,
    String? created_at,
  }) {
    return CategoryProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image_url: image_url ?? this.image_url,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image_url': image_url,
      'created_at': created_at,
    };
  }

  factory CategoryProduct.fromMap(Map<String, dynamic> map) {
    return CategoryProduct(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image_url: map['image_url'] as String,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryProduct.fromJson(String source) => CategoryProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description, image_url: $image_url, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant CategoryProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image_url == image_url &&
      other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image_url.hashCode ^
      created_at.hashCode;
  }
}
