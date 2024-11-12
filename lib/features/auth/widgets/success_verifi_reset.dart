import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class SuccessVerifiReset extends StatelessWidget {
  final String title, subTitle, image;
  const SuccessVerifiReset({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: TSizes.appBarHeight,
        ),
        Image(
          width: TDeviceUtils.getScreenWidth(context) * 0.6,
          image: AssetImage(image),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.popUntil(
                context,
                (router) => router.settings.name == 'LoginPage',
              );
            },
            child: const Text(TTexts.done),
          ),
        ),
      ],
    );
  }
}
