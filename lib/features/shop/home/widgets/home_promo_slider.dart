import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/shop/home/banner_controller.dart';
import 'package:e_commerce/features/shop/home/widgets/rounded_container.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'rounded_image.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  @override
  Widget build(BuildContext context) {
    final BannerController controller = BannerController.instance;
    return Column(
      children: [
        CarouselSlider(
          items: widget.banners
              .map((image) => TRoundedImage(imageUrl: image))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => setState(() {
              controller.updateCarouselIndicator(index);
            }),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 3; i++)
                RoundedContainer(
                  width: 20,
                  height: 5,
                  radius: 50,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex == i
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                )
            ],
          ),
        )
      ],
    );
  }
}
