import 'package:e_commerce/common/widgets/brand_card.dart';
import 'package:e_commerce/common/widgets/grid_layout.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class StoreFeaturedBrands extends StatelessWidget {
  const StoreFeaturedBrands({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Featured Brands',
          viewAllClick: () {},
        ),
        GridLayout(
          itemCount: 4,
          mainAxisExtent: 70,
          itemBuilder: (_, index) {
            return BrandCard(
              isDark: isDark,
              image: TImages.clothIcon,
              name: 'Nike',
              numberOfProducts: '256 Products',
            );
          },
        ),
      ],
    );
  }
}
