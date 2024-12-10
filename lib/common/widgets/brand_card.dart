import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'rounded_container.dart';
import 'rounded_image.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.isDark,
    required this.image,
    required this.name,
    required this.numberOfProducts,
    this.showBorder = true,
  });
  final String image, name, numberOfProducts;
  final bool showBorder;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: Colors.transparent,
      showBorder: showBorder,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: TRoundedImage(
              imageUrl: image,
              overlayColor: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(width: TSizes.xs),
                    Icon(
                      Icons.verified,
                      size: TSizes.iconXs,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ],
                ),
                Text(
                  numberOfProducts,
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
