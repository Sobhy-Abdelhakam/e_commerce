import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'home_categories_section.dart';
import 'search_field_with_filter_button.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchFieldWithFilterButton(),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          HomeCategoriesSection(),
        ],
      ),
    );
  }
}
