import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/ui/views/home/home_view.dart';
import 'package:cheffresh/ui/views/identity/login/login_view.dart';
import 'package:cheffresh/ui/views/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';

const String initialRoute = 'Splash Screen';

class Router {
  static dynamic routes() => {
        initialRoute: (BuildContext context) => SplashView(),
        RoutePaths.Login: (BuildContext context) => LoginView(),
        RoutePaths.Home: (BuildContext context) => HomeView(),
      };
}
