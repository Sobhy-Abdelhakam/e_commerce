import 'package:e_commerce/features/shop/home/widgets/home_categories_section.dart';
import 'package:e_commerce/features/shop/home/widgets/search_field_with_filter_button.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/home_product_item.dart';
import 'widgets/home_promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              TTexts.discover,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                ),
                onPressed: () {},
              )
            ],
            automaticallyImplyLeading: false,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 80),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.md),
                child: SearchFieldWithFilterButton(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.spaceBtwSections,
              ),
              child: Column(
                children: [
                  HomeCategoriesSection(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  PromoSlider(
                    banners: [
                      TImages.banner1,
                      TImages.banner2,
                      TImages.banner3
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Add a section header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TTexts.popularProducts,
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextButton(onPressed: () {}, child: const Text('View all')),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.spaceBtwItems / 2,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 290,
                mainAxisSpacing: TSizes.gridViewSpacing,
                crossAxisSpacing: TSizes.gridViewSpacing,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => const HomeProductItem(
                  productImage: TImages.tShirts,
                  productName: 'Regular Fit Slogan',
                  productPrice: '1,190 \$',
                ),
                childCount: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
