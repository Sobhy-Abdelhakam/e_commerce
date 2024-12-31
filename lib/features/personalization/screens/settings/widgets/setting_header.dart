import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        TRoundedImage(
          width: 60,
          height: 60,
          imageUrl: TImages.profile,
          borderRadius: 100,
          backgroundColor: isDark ? TColors.darkerGrey : TColors.darkGrey,
          padding: const EdgeInsets.only(bottom: 1, top: 18),
          overlayColor: isDark ? TColors.grey : TColors.backgroundLight,
        ),
        const SizedBox(
          width: TSizes.sm,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sobhy Abdel Hakam',
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.xs),
              Text(
                'sobhy.abdelhakam25@gmail.com',
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ProfileScreen();
                },
              ),
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
      ],
    );
  }
}
