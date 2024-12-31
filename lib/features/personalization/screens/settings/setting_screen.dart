import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:e_commerce/common/widgets/section_header.dart';
import 'package:e_commerce/features/personalization/screens/settings/widgets/setting_header.dart';
import 'package:e_commerce/features/personalization/screens/settings/widgets/setting_menu_tile.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Account'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingHeader(),
            const SizedBox(height: TSizes.spaceBtwSections),
            const SectionHeader(title: 'Account Setting'),
            SettingMenuTile(
              title: 'My Addresses',
              subtitle: 'Set shopping delivery address',
              leadingIcon: Icons.home_outlined,
              click: () {},
            ),
            SettingMenuTile(
              click: () {},
              leadingIcon: Icons.shopping_cart_outlined,
              title: 'My Cart',
              subtitle: 'Add, remove products and move to checkout',
            ),
            SettingMenuTile(
              click: () {},
              leadingIcon: Icons.shopping_bag_outlined,
              title: 'My Orders',
              subtitle: 'In-progress and Completed Orders',
            ),
            SettingMenuTile(
              click: () {},
              leadingIcon: Icons.account_balance_outlined,
              title: 'Bank Account',
              subtitle: 'Withdraw balance to registered bank account',
            ),
            SettingMenuTile(
              click: () {},
              leadingIcon: Icons.discount_outlined,
              title: 'My Coupons',
              subtitle: 'List of all the discounted coupons',
            ),
            SettingMenuTile(
              click: () {},
              leadingIcon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Set any kind of notification message',
            ),
            SettingMenuTile(
              click: () {},
              leadingIcon: Icons.security_outlined,
              title: 'Account Privacy',
              subtitle: 'Manage data usage and connection privacy',
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const SectionHeader(title: 'App Settings'),
            SettingMenuTile(
              title: 'Load Data',
              subtitle: 'Upload Data to your Cloud Firebase',
              leadingIcon: Icons.upload_file_outlined,
              click: () {},
            ),
            SettingMenuTile(
              title: 'Geolocation',
              subtitle: 'Set recommendation based on location',
              leadingIcon: Icons.location_on_outlined,
              trailingWidget: Switch(value: true, onChanged: (value) {}),
              click: () {},
            ),
            SettingMenuTile(
              title: 'Safe Mode',
              subtitle: 'Search result is safe for all ages',
              leadingIcon: Icons.lock_person_outlined,
              trailingWidget: Switch(value: false, onChanged: (value) {}),
              click: () {},
            ),
            SettingMenuTile(
              title: 'HD Image Quality',
              subtitle: 'Set image quality to be seen',
              leadingIcon: Icons.image_outlined,
              trailingWidget: Switch(value: false, onChanged: (value) {}),
              click: () {},
            ),
          ],
        ),
      ),
    );
  }
}
