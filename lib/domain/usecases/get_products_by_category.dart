import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/repository/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository _productRepository;
  GetProductsByCategory(this._productRepository);

  Future<List<Product>> call(String category) async{
    return await _productRepository.getProductsByCategory(category);
  }
}