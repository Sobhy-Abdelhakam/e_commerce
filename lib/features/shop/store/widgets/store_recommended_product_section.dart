import 'package:e_commerce/common/widgets/grid_layout.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class StoreRecommendedProductSection extends StatelessWidget {
  const StoreRecommendedProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'You might like',
          viewAllClick: () {},
        ),
        GridLayout(
          itemCount: 4,
          itemBuilder: (_, index) => ProductCardVertical(
            productImage: TImages.tShirts,
            productName: 'Regular Fit Slogan',
            productPrice: '1,190 \$',
            discount: 78,
            isFavorite: true,
            brand: 'Nike',
            itemClick: (){},
          ),
        ),
      ],
    );
  }
}