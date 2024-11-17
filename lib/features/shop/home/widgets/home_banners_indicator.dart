import 'package:flutter/material.dart';

class HomeBannersIndicator extends StatelessWidget {
  const HomeBannersIndicator({
    super.key,
    this.margin,
    this.padding,
    this.backgroundColor = Colors.white,
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width, height, radius;
  final EdgeInsets? margin, padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}
