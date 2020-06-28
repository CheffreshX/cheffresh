import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/ui/views/food/add_food_item_view.dart';
import 'package:cheffresh/ui/views/home/home_view.dart';
import 'package:cheffresh/ui/views/identity/login/login_view.dart';
import 'package:cheffresh/ui/views/splash/splash_view.dart';
import 'package:flutter/material.dart';

const String initialRoute = 'Splash Screen';

class Router {
  static dynamic routes() => {
        initialRoute: (BuildContext context) => SplashView(),
        RoutePaths.Login: (BuildContext context) => LoginView(),
        RoutePaths.Home: (BuildContext context) => HomeView(),
        RoutePaths.AddFood: (BuildContext context) => AddFoodItemView(),
      };
}
