import 'package:e_commerce/features/shop/card/card_screen.dart';
import 'package:e_commerce/features/shop/home/home_screen.dart';
import 'package:e_commerce/features/shop/store/store_screen.dart';
import 'package:e_commerce/features/shop/wishlist/favorite_screen.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    StoreScreen(),
    FavoriteScreen(),
    CardScreen(),
    Center(
      child: Text('Profile'),
    ),
  ];
  void changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: changeCurrentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.store_outlined),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline_rounded),
            label: 'Favorite',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Card',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
