import 'package:e_commerce/common/widgets/grid_layout.dart';
import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/features/shop/home/widgets/home_categories_section.dart';
import 'package:e_commerce/features/shop/home/widgets/search_field_with_filter_button.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/product_card_vertical.dart';
import 'widgets/home_promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: TTexts.discover,
        icon: Icons.notifications_outlined,
        iconClick: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const SearchFieldWithFilterButton(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const HomeCategoriesSection(),
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
              GridLayout(
                itemCount: 8,
                itemBuilder: (_, index) => const ProductCardVertical(
                  productImage: TImages.tShirts,
                  productName: 'Regular Fit Slogan',
                  productPrice: '1,190 \$',
                  discount: '78%',
                  isFavorite: false,
                  brand: 'Nike',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
