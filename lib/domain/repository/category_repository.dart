import 'package:e_commerce/domain/models/category.dart';

abstract class CategoryRepository {
  List<CategoryProduct> getCategories();
}