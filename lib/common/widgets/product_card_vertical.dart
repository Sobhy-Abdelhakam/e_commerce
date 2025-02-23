import 'package:e_commerce/common/widgets/circular_icon.dart';
import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.brand,
    this.discount,
    this.discountPercentage,
    required this.isFavorite,
    required this.itemClick,
  });

  final String productImage, productName, productPrice;
  final String? brand;
  final double? discount;
  final int? discountPercentage;
  final bool isFavorite;
  final VoidCallback itemClick;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: itemClick,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: TColors.darkGrey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: RoundedContainer(
                // height: 200,
                padding: const EdgeInsets.all(TSizes.sm),
                backgroundColor: isDark ? TColors.dark : TColors.light,
                child: Stack(
                  children: [
                    Center(child: TRoundedImage(imageUrl: productImage)),
                    if (discountPercentage != null)
                      Positioned(
                        top: TSizes.sm,
                        child: RoundedContainer(
                          radius: TSizes.sm,
                          backgroundColor:
                              TColors.secondaryDark.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            '$discountPercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: Colors.black),
                          ),
                        ),
                      ),
                    Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: isFavorite
                            ? const CircularIcon(
                                icon: Icons.favorite,
                                color: Colors.red,
                              )
                            : const CircularIcon(icon: Icons.favorite_border)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    if (brand != null)
                      Text(
                        brand!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productPrice,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (discount != null)
                        Text(
                          '$discount\$',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Icon(
                      Icons.add,
                      color: TColors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
