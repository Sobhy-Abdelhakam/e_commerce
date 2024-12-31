import 'package:e_commerce/domain/models/product.dart';

abstract class ProductRepository {
  List<Product> getProducts();
  Product getProductById(String id);
  List<Product> getProductsByCategory(String category);
  List<Product> getProductsBySeller(String seller);
}