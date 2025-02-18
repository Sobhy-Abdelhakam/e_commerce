import 'package:e_commerce/common/widgets/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/features/shop/product_details/product_details_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'home_categories_section.dart';
import 'home_promo_slider.dart';
import 'search_field_with_filter_button.dart';

class HomeScreenView extends StatelessWidget {
  final Future<List> categories;
  final Future<List> products;
  const HomeScreenView(
      {super.key, required this.categories, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const SearchFieldWithFilterButton(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            HomeCategoriesSection(
              categories: categories,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const PromoSlider(
              banners: [TImages.banner1, TImages.banner2, TImages.banner3],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SectionHeader(
              title: TTexts.popularProducts,
              viewAllClick: () {},
            ),
            FutureBuilder(
                future: products,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products available"));
                  }
                  final data = snapshot.data!;
                  return GridLayout(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        final Product product = data[index];
                        return ProductCardVertical(
                          productImage: product.images.first,
                          productName: product.name,
                          productPrice: '${product.price} \$',
                          discount: product.discount,
                          isFavorite: false,
                          brand: 'Nike',
                          itemClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ProductDetailsScreen();
                                },
                              ),
                            );
                          },
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
