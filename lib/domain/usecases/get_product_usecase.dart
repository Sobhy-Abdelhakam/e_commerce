import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/repository/product_repository.dart';

class GetProductUsecase {
  final ProductRepository _productRepository;
  GetProductUsecase(this._productRepository);

  Future<Product> call(String id) async{
    return await _productRepository.getProductById(id);
  }
}