import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'home_category_item.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => HomeCategoryItem(
              itemImage: 'assets/icons/categories/icons8-shoes-64.png',
              itemCategory: 'Category',
              onPressed: (){},
            ),
          ),
        ),
      ],
    );
  }
}
