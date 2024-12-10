import 'package:e_commerce/common/widgets/grid_layout.dart';
import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/common/widgets/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Wishlist', icon: Icons.add, iconClick: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: GridLayout(
              itemCount: 6,
              itemBuilder: (_, index) {
                return const ProductCardVertical(
                  productImage: TImages.tShirts,
                  productName: 'Regular Fit Slogan',
                  productPrice: '1,190 \$',
                  discount: '78%',
                  isFavorite: true,
                  brand: 'Nike',
                );
              }),
        ),
      ),
    );
  }
}
