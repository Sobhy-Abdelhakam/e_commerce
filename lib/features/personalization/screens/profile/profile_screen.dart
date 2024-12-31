import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Profile',
        haveBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ProfileImageWithEditIcon(isDark: isDark),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const SectionHeader(title: 'Profile Information'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            ProfileMenu(
              title: 'Name',
              value: 'Sobhy Abdel Hakam',
              onClick: () {},
            ),
            ProfileMenu(
              title: 'Username',
              value: 'coding_with_t',
              onClick: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const SectionHeader(title: 'Personal Information'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            ProfileMenu(
              title: 'User Id',
              value: '425632',
              icon: Icons.copy,
              onClick: () {},
            ),
            ProfileMenu(
              title: 'Email',
              value: 'sobhy.abdelhakam25@gmail.com',
              onClick: () {},
            ),
            ProfileMenu(
                title: 'Phone Number', value: '01121015492', onClick: () {}),
            ProfileMenu(title: 'Gender', value: 'Male', onClick: () {}),
            ProfileMenu(
                title: 'Date Of Birth', value: '25-10-2000', onClick: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Delete Account',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageWithEditIcon extends StatelessWidget {
  const ProfileImageWithEditIcon({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TRoundedImage(
          width: 120,
          height: 120,
          imageUrl: TImages.profile,
          borderRadius: 100,
          backgroundColor: isDark ? TColors.darkerGrey : TColors.darkGrey,
          padding: const EdgeInsets.only(bottom: 2, left: 2, right: 2, top: 24),
          overlayColor: isDark ? TColors.grey : TColors.backgroundLight,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    this.icon = Icons.arrow_forward_ios,
    required this.onClick,
  });
  final String title, value;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: onClick,
            icon: Icon(
              icon,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
