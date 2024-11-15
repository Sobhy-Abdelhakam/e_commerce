import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/home_screen_app_bar.dart';
import 'widgets/home_screen_header.dart';

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
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.spaceBtwSections,
              horizontal: TSizes.defaultSpace,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                mainAxisSpacing: TSizes.sm,
                crossAxisSpacing: TSizes.sm,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/success.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: TSizes.md,
                                right: TSizes.md,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_outline,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Text(
                        'Regular Fit Slogan',
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text('1,190 \$'),
                    ],
                  );
                },
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
