import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'rounded_image.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners.map((image) => TRoundedImage(imageUrl: image)).toList(),
      options: CarouselOptions(viewportFraction: 1),
    );
  }
}
