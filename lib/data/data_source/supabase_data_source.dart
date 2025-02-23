import 'package:e_commerce/domain/models/category.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String categoryTable = 'Category';
  final String productTable = 'products';

  Future<List<CategoryProduct>> getCategories() async {
    final response = await _supabase.from(categoryTable).select();
    return response.map(CategoryProduct.fromMap).toList();
  }

  Future<List<Product>> getProducts() async {
    final response = await _supabase
        .from(productTable)
        .select('*, productimages(image_url)');
    return response.map(Product.fromMap).toList();
  }

  Future<Product> getProductById(String id) async {
    final response = await _supabase
        .from(productTable)
        .select('*, productimages(image_url)')
        .eq('id', id)
        .single();
    return Product.fromMap(response);
  }

  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final response = await _supabase
        .from(productTable)
        .select('*, productimages(image_url)')
        .eq('category_id', categoryId);
    return response.map(Product.fromMap).toList();
  }
}
