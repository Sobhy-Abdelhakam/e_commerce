import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
