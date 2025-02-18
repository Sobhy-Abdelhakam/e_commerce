import 'package:e_commerce/data/data_source/supabase_data_source.dart';
import 'package:e_commerce/domain/models/category.dart';
import 'package:e_commerce/domain/repository/category_repository.dart';

class CategoryRepoImpl implements CategoryRepository {
  final SupabaseDataSource _dataSource;
  CategoryRepoImpl(this._dataSource);

  @override
  Future<List<CategoryProduct>> getCategories() async {
    final categories = await _dataSource.getCategories();
    return categories;
  }
}
