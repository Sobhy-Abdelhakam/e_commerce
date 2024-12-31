import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            ],
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.5,
              title: const Text('T_Shirt'),
              background: Stack(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(TImages.tShirts),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 30,
                    left: TSizes.defaultSpace,
                    child: SizedBox(
                      height: 80,
                      child: ListView.separated(
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (_, index) => TRoundedImage(
                          width: 80,
                          backgroundColor:
                              isDark ? TColors.dark : TColors.white,
                          border: Border.all(color: TColors.primaryLight),
                          padding: const EdgeInsets.all(TSizes.sm),
                          imageUrl: TImages.tShirts,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            expandedHeight: TDeviceUtils.getScreenHeight(context) * 0.5,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: TSizes.iconMd,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '5.0',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const TextSpan(text: '(199)'),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              size: TSizes.iconMd,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              RoundedContainer(
                                radius: TSizes.sm,
                                backgroundColor:
                                    TColors.secondaryDark.withOpacity(0.8),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: TSizes.sm, vertical: TSizes.xs),
                                child: Text(
                                  '25%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: Colors.black),
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                '250\$',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                '175\$',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Row(
                            children: [
                              Text('Status:',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              Text(
                                'In Stock',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Row(
                            children: [
                              const TRoundedImage(
                                imageUrl: TImages.cosmeticsIcon,
                                width: 32,
                                height: 32,
                                overlayColor: TColors.black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Nike',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(width: TSizes.xs),
                                  Icon(
                                    Icons.verified,
                                    size: TSizes.iconXs,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(
                            title: 'Size',
                          ),
                          SizedBox(height: TSizes.spaceBtwItems / 2),
                          Wrap(
                            spacing: 8,
                            children: [
                              ChoiceChip(label: Text('EU 34'), selected: true),
                              ChoiceChip(label: Text('EU 34'), selected: false),
                              ChoiceChip(label: Text('EU 34'), selected: false),
                            ],
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Check Out',
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      const SectionHeader(title: 'Discription'),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      const ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimMode: TrimMode.Line,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SectionHeader(title: 'Reviews(199)'),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.black,
                                size: 30,
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}