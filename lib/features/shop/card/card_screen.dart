import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: 'My Card'),
      body: Center(child: EmptyCart()),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.shopping_cart_outlined,
          size: 80,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(
          'Your Cart Is Empty!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(
          'When you add products, they\'ll appear here.',
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
