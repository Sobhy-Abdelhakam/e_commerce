import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'store_featured_brands_section.dart';
import 'store_recommended_product_section.dart';

class StoreTabBarView extends StatelessWidget {
  const StoreTabBarView({
    super.key,
    required this.tabs,
  });
  final List tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDark ? TColors.backgroundDark : TColors.backgroundLight,
      child: TabBarView(
        children: tabs
            .map(
              (_) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...List.generate(
                      2,
                      (child) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: StoreFeaturedBrandsSection(),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const StoreRecommendedProductSection()
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
