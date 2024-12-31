import 'package:e_commerce/domain/models/product.dart';

abstract class ProductRepository {
  List<Product> getProducts();
  Future<Product> getProductById(String id);
  Future<List<Product>> getProductsByCategory(String category);
  Future<List<Product>> getProductsBySeller(String seller);
}