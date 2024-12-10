import 'package:e_commerce/common/widgets/brand_card.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StoreFeaturedBrandsSection extends StatelessWidget {
  const StoreFeaturedBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return RoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          BrandCard(
            isDark: isDark,
            image: TImages.clothIcon,
            name: 'Nike',
            numberOfProducts: '256 Products',
            showBorder: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TRoundedImage(
                imageUrl: TImages.tShirts,
                width: 100,
                height: 100,
                padding: EdgeInsets.all(TSizes.defaultSpace),
                backgroundColor: TColors.darkGrey,
              ),
              TRoundedImage(
                imageUrl: TImages.tShirts,
                width: 100,
                height: 100,
                padding: EdgeInsets.all(TSizes.defaultSpace),
                backgroundColor: TColors.darkGrey,
              ),
              TRoundedImage(
                imageUrl: TImages.tShirts,
                width: 100,
                height: 100,
                padding: EdgeInsets.all(TSizes.defaultSpace),
                backgroundColor: TColors.darkGrey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
