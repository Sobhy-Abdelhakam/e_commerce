import 'package:e_commerce/domain/models/category.dart';

abstract class CategoryRepository {
  Future<List<CategoryProduct>> getCategories();
}