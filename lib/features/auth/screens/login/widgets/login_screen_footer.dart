import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginScreenFooter extends StatelessWidget {
  const LoginScreenFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
                child: Divider(
              thickness: 0.5,
              indent: 40,
              endIndent: 10,
            )),
            Text(
              TTexts.orSignInWith,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Flexible(
              child: Divider(
                thickness: 0.5,
                indent: 10,
                endIndent: 40,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.grey, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.google),
                ),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.grey, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.facebook),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
