// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Seller {
  String id;
  String name;
  String phone;
  double total_sales;
  Seller({
    required this.id,
    required this.name,
    required this.phone,
    required this.total_sales,
  });

  Seller copyWith({
    String? id,
    String? name,
    String? phone,
    double? total_sales,
  }) {
    return Seller(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      total_sales: total_sales ?? this.total_sales,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'total_sales': total_sales,
    };
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      total_sales: map['total_sales'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Seller.fromJson(String source) => Seller.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Seller(id: $id, name: $name, phone: $phone, total_sales: $total_sales)';
  }

  @override
  bool operator ==(covariant Seller other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.phone == phone &&
      other.total_sales == total_sales;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      total_sales.hashCode;
  }
}
