import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            IconButton(
              icon: Badge.count(
                count: 5,
                child: const Icon(Icons.notifications_outlined),
              ),
              onPressed: () {},
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerScrool) {
            return [
              SliverAppBar(
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
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      SectionHeader(
                        title: 'Featured Brands',
                        viewAllClick: () {},
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 70,
                        ),
                        itemBuilder: (_, index) {
                          return RoundedContainer(
                            padding: const EdgeInsets.all(TSizes.sm),
                            backgroundColor: Colors.transparent,
                            showBorder: true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: TRoundedImage(
                                    imageUrl: TImages.clothIcon,
                                    overlayColor:
                                        isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: TSizes.spaceBtwItems / 2),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Nike',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          const SizedBox(width: TSizes.xs),
                                          Icon(
                                            Icons.verified,
                                            size: TSizes.iconXs,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )
                                        ],
                                      ),
                                      Text(
                                        '256 Products',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // ),
                bottom: TabBar(
                  isScrollable: true,
                  labelStyle: Theme.of(context).textTheme.titleLarge,
                  tabs: const [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: List.generate(
              5,
              (_) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace, vertical: TSizes.xs),
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
