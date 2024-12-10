import 'package:e_commerce/common/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/store_collapsing_header.dart';
import 'widgets/store_tab_bar_view.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  // Tab Titles
  List<String> get tabs => [
        'Sports',
        'Furniture',
        'Electronics',
        'Clothes',
        'Cosmetics',
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Store',
        icon: Icons.notifications_outlined,
        iconClick: () {},
        badgeCount: 5,
      ),
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (_, innerScrool) {
            return [
              StoreCollapsingHeader(tabs: tabs),
            ];
          },
          body: StoreTabBarView(tabs: tabs),
        ),
      ),
    );
  }
}
