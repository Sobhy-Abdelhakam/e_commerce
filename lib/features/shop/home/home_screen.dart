import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/home_product_item.dart';
import 'widgets/home_screen_app_bar.dart';
import 'widgets/home_screen_header.dart';
import 'widgets/rounded_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeAppBar(),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenHeader(),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            sliver: SliverToBoxAdapter(
              child: TRoundedImage(
                imageUrl: TImages.banner3,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                mainAxisSpacing: TSizes.sm,
                crossAxisSpacing: TSizes.sm,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => const HomeProductItem(),
                childCount: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
