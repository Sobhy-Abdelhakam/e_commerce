import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/home_product_item.dart';
import 'widgets/home_promo_slider.dart';
import 'widgets/home_screen_app_bar.dart';
import 'widgets/home_screen_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          SliverPadding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
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
