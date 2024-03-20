
import 'package:flutter/material.dart';
import 'package:start/features/admin/screens/add_product.dart';
import 'package:start/features/auth/screens/auth_screen.dart';
import 'package:start/features/auth/widgets/bottom_bar.dart';
import 'package:start/features/home/screens/category_deals_screen.dart';
import 'package:start/features/home/screens/home_screen.dart';
import 'package:start/features/search/screens/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );


    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

      case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

       case AddProduct.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProduct(),
      );    


      case CategoryDealsScreen.routeName:
      var category =routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  CategoryDealsScreen(
          category: category,
        ),
      );

      case SearchScreen.routeName:
      var searchQuery =routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  CategoryDealsScreen(
          category: searchQuery,
        ),
      );
  


    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}