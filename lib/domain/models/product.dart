class Product {
  final String id;
  final String name;
  final String? description;
  final double price;
  final double? discountPrice;
  final int? discountPercentage;
  final int stock;
  final String categoryId;
  final String? brand;
  final double rating;
  final int reviewsCount;
  final List<String> images;
  final bool isFeatured;
  final bool isAvailable;
  final List<String> tags;
  final Map<String, String> specifications;
  Product({
    required this.id,
    required this.name,
    this.description,
    this.discountPrice,
    this.discountPercentage,
    required this.stock,
    required this.price,
    required this.categoryId,
    this.brand,
    required this.rating,
    required this.reviewsCount,
    required this.images,
    required this.isFeatured,
    required this.isAvailable,
    required this.tags,
    required this.specifications,
  });

  // Product copyWith({
  //   String? id,
  //   String? name,
  //   String? description,
  //   double? price,
  //   int? discount,
  //   String? categoryId,
  //   List<String>? images,
  // }) {
  //   return Product(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     description: description ?? this.description,
  //     price: price ?? this.price,
  //     categoryId: categoryId ?? this.categoryId,
  //     discount: discount ?? this.discount,
  //     images: images ?? this.images,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'price': price,
  //     'category_id': categoryId,
  //     'discount': discount,
  //     'images': images,
  //   };
  // }

  // factory Product.fromMap(Map<String, dynamic> map) {
  //   return Product(
  //     id: map['id'] as String,
  //     name: map['name'] as String,
  //     description: map['description'] as String?,
  //     price: (map['price'] is int)
  //         ? (map['price'] as int).toDouble()
  //         : map['price'],
  //     categoryId: map['category_id'] as String,
  //     discount: map['discount'] as int?,
  //     images: (map['productimages'] != null)
  //         ? List<String>.from((map['productimages'] as List<dynamic>)
  //             .map((img) => img['image_url'].toString()))
  //         : [], // Convert nested images properly
  //   );
  // }
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,
      discountPercentage: json['discount_percentage'] as int?,
      stock: json['stock'] as int,
      categoryId: json['category_id'],
      brand: json['brand'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviews_count'] as int,
      images: json['productimages'] != null
          ? List<String>.from((json['productimages'] as List)
              .map((img) => img['image_url'].toString()))
          : [],
      isFeatured: json['is_featured'] as bool,
      isAvailable: json['is_available'] as bool,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      specifications: json['specifications'] != null
          ? Map<String, String>.from(json['specifications'])
          : {},
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Product.fromJson(String source) =>
  //     Product.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Product(id: $id, name: $name, description: $description, price: $price, category: $categoryId, images: $images)';
  // }

  // @override
  // bool operator ==(covariant Product other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.name == name &&
  //       other.description == description &&
  //       other.price == price &&
  //       other.categoryId == categoryId &&
  //       other.discount == discount &&
  //       listEquals(other.images, images);
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       name.hashCode ^
  //       description.hashCode ^
  //       price.hashCode ^
  //       categoryId.hashCode ^
  //       discount.hashCode ^
  //       images.hashCode;
  // }
}
