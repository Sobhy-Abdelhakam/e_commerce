import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.onPressed,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.borderRadius = TSizes.md,
    this.overlayColor,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final EdgeInsets? padding;
  final double borderRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: CachedNetworkImage(
                imageUrl: imageUrl,
                color: overlayColor,
                fit: fit,
                progressIndicatorBuilder: (c, url, downloadProgress) {
                  return Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  );
                },
                errorWidget: (c, url, error) {
                  return const Center(child: Icon(Icons.error));
                })

            // Image(
            //   image: AssetImage(imageUrl),

            //   color: overlayColor,
            //   fit: fit,
            // ),
            ),
      ),
    );
  }
}
