import 'package:e_commerce/data/data_source/supabase_data_source.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/repository/product_repository.dart';

class ProductRepoImpl implements ProductRepository {
  final SupabaseDataSource _dataSource;
  ProductRepoImpl(this._dataSource);
  @override
  Future<Product> getProductById(String id) async{
    final product = await _dataSource.getProductById(id);
    return product;
  }

  @override
  Future<List<Product>> getProducts() async{
    final products = await _dataSource.getProducts();
    return products;
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async{
    final products = await _dataSource.getProductsByCategory(categoryId);
    return products;
  }
}