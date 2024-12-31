import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
    this.icon,
    this.iconClick,
    this.haveBackArrow = false,
    this.badgeCount,
  });
  final String title;
  final IconData? icon;
  final VoidCallback? iconClick;
  final bool haveBackArrow;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final iconWidget = badgeCount != null
        ? Badge.count(
            count: badgeCount!,
            child: Icon(icon),
          )
        : Icon(icon);

    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      actions: [
        if (icon != null)
          IconButton(
            icon: iconWidget,
            onPressed: iconClick,
          ),
      ],
      automaticallyImplyLeading: haveBackArrow,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}
