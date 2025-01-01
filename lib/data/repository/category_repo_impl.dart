import 'package:e_commerce/domain/models/category.dart';
import 'package:e_commerce/domain/repository/category_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryRepoImpl implements CategoryRepository {
  final Supabase _supabase;

  CategoryRepoImpl(this._supabase);
  @override
  Future<List<CategoryProduct>> getCategories() async {
    final response = await _supabase.client.from('Categories').select();
    return response.map(CategoryProduct.fromMap).toList();
  }
  
}