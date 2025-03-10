import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/features/auth/presentation/screens/forget_password/forget/forget_password.dart';
import 'package:e_commerce/features/auth/presentation/screens/login/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/signup/registeration/signup_screen.dart';
import 'package:e_commerce/features/onboarding/on_boarding_view.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_commerce/features/personalization/screens/settings/setting_screen.dart';
import 'package:e_commerce/features/shop/home/home_screen.dart';
import 'package:e_commerce/features/shop/product_details/product_details_screen.dart';
import 'package:e_commerce/features/shop/products_by_category/products_by_category.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings){
    final arguments = settings.arguments;

    switch(settings.name){
      case Routes.onBoardingScreen:
        return _buildRoute(const OnBoardingView());
      case Routes.login:
        return _buildRoute(const LoginScreen());
      case Routes.register:
        return _buildRoute(const SignupScreen());
      case Routes.forgetPassword:
        return _buildRoute(const ForgetPassword());
      case Routes.navigationMenu:
        return _buildRoute(const NavigationMenu());
      case Routes.home:
        return _buildRoute(const HomeScreen());
      case Routes.profile:
        return _buildRoute(const ProfileScreen());
      case Routes.productDetails:
        return _buildRoute(ProductDetailsScreen(product: arguments as Product));
      case Routes.productsByCategory:
        return _buildRoute(ProductsByCategory(categoryId: arguments as String));
      case Routes.settings:
        return _buildRoute(const SettingScreen());
      default:
        return _buildRoute(const ErrorPage());
    }
  }

  // static PageRouteBuilder _buildRoute(Widget screen) {
  //   return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => screen, 
  //   transitionsBuilder: (context, animation, secondaryAnimation, child){
  //     const begin = Offset(1.0, 0.0);
  //     const end = Offset.zero;
  //     const curve = Curves.ease;
  //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //     var offsetAnimation = animation.drive(tween);
  //     return SlideTransition(position: offsetAnimation, child: child,);
  //   }
  //   );
  // }
  static MaterialPageRoute _buildRoute(Widget screen){
    return MaterialPageRoute(builder: (_) => screen);
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Page Found'),
      ),
    );
  }
}