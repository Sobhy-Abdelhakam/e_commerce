import 'package:e_commerce/features/shop/store/widgets/store_featured_brands.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StoreCollapsingHeader extends StatelessWidget {
  const StoreCollapsingHeader({
    super.key,
    required this.tabs,
  });

  final List tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SliverAppBar(
      pinned: true,
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor:
          isDark ? TColors.backgroundDark : TColors.backgroundLight,
      expandedHeight: 380,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                label: Text('Search in store'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            StoreFeaturedBrands(isDark: isDark),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(TSizes.appBarHeight),
        child: ColoredBox(
          color: isDark ? TColors.backgroundDark : TColors.backgroundLight,
          child: TabBar(
              isScrollable: true,
              labelStyle: Theme.of(context).textTheme.titleLarge,
              tabs: tabs.map((tab) => Tab(child: Text(tab))).toList()),
        ),
      ),
    );
  }
}
