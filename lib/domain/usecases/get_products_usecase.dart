import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/repository/product_repository.dart';

class GetProductsUsecase {
  final ProductRepository _productRepository;

  GetProductsUsecase(this._productRepository);

  Future<List<Product>> call() async{
    return await _productRepository.getProducts();
  }
}