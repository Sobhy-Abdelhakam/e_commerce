import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.showShadow = false,
    this.showBorder = false,
    this.padding,
    this.borderColor = TColors.borderPrimary,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null,
          boxShadow: <BoxShadow>[
            if (showShadow)
              BoxShadow(
                color: TColors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: child,
      ),
    );
  }

  // final double? width, height;
  // final double radius;
  // final EdgeInsets? margin, padding;
  // final Color? backgroundColor;
  // final Widget? child;

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: width,
  //     height: height,
  //     margin: margin,
  //     padding: padding,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(radius),
  //       color: backgroundColor,
  //     ),
  //     child: child,
  //   );
  // }
}
