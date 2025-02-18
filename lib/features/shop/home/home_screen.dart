
import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/data/data_source/supabase_data_source.dart';
import 'package:e_commerce/data/repository/category_repo_impl.dart';
import 'package:e_commerce/data/repository/product_repo_impl.dart';
import 'package:e_commerce/domain/models/category.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/usecases/get_categories_usecase.dart';
import 'package:e_commerce/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/features/shop/home/widgets/home_screen_view.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<List<CategoryProduct>> categoriesFuture = GetCategoriesUsecase(CategoryRepoImpl(SupabaseDataSource())).call();
    final Future<List<Product>> productFuture = GetProductsUsecase(ProductRepoImpl(SupabaseDataSource())).call();
    return Scaffold(
      appBar: MainAppBar(
        title: TTexts.discover,
        icon: Icons.notifications_outlined,
        iconClick: () {},
      ),
      body: HomeScreenView(categories: categoriesFuture, products: productFuture, )
    );
  }
}
