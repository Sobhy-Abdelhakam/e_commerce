import 'package:flutter/material.dart';

class SettingMenuTile extends StatelessWidget {
  const SettingMenuTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.click,
    this.trailingWidget,
  });
  final String title, subtitle;
  final IconData leadingIcon;
  final Widget? trailingWidget;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      leading: Icon(
        leadingIcon,
        size: 28,
        color: Theme.of(context).colorScheme.primary,
      ),
      trailing: trailingWidget,
      onTap: click,
    );
  }
}
