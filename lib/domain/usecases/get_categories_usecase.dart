import 'package:e_commerce/domain/models/category.dart';
import 'package:e_commerce/domain/repository/category_repository.dart';

class GetCategoriesUsecase {
  final CategoryRepository _repository;
  GetCategoriesUsecase(this._repository);

  Future<List<CategoryProduct>> call() async{
    return await _repository.getCategories();
  }
}