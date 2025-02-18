import 'package:e_commerce/common/widgets/grid_layout.dart';
import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/data/data_source/supabase_data_source.dart';
import 'package:e_commerce/data/repository/product_repo_impl.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/usecases/get_products_by_category.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductsByCategory extends StatefulWidget {
  final String categoryId;
  const ProductsByCategory({super.key, required this.categoryId});

  @override
  State<ProductsByCategory> createState() => _ProductsByCategoryState();
}

class _ProductsByCategoryState extends State<ProductsByCategory> {
  Future<List<Product>>? productFuture;

  @override
  void initState() {
    super.initState();
    productFuture = GetProductsByCategory(ProductRepoImpl(SupabaseDataSource())).call(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Wishlist', icon: Icons.add, iconClick: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: GridLayout(
              itemCount: 6,
              itemBuilder: (_, index) {
                return ProductCardVertical(
                  productImage: TImages.tShirts,
                  productName: 'Regular Fit Slogan',
                  productPrice: '1,190 \$',
                  discount: 78,
                  isFavorite: true,
                  brand: 'Nike',
                  itemClick: () {},
                );
              }),
        ),
      ),
    );
  }
}
