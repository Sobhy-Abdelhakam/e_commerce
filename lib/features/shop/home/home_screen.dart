import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/home_product_item.dart';
import 'widgets/home_promo_slider.dart';
import 'widgets/home_screen_app_bar.dart';
import 'widgets/home_screen_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    // Desired aspect ratio of the grid items (width/height)
    const double childAspectRatio = 18 / 30;
    // Desired width of each grid item
    const double itemWidth = 180;
    // Calculate crossAxisCount dynamically
    final int crossAxisCount = (screenWidth / itemWidth).floor();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBar()),
          const SliverToBoxAdapter(child: HomeScreenHeader()),
          const SliverPadding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            sliver: SliverToBoxAdapter(
              child: PromoSlider(
                banners: [TImages.banner1, TImages.banner2, TImages.banner3],
              ),
            ),
          ),
          // Add a section header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.sm,
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
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                // mainAxisExtent: 290,
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
