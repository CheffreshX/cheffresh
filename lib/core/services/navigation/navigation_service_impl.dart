import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;

import 'navigation_service.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

class NavigationServiceImpl implements NavigationService {
  @override
  GlobalKey<NavigatorState> get navigatorKey => globalNavigatorKey;

  @override
  Future<dynamic> pushNamed(String routeName, {Object arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments}) {
    return navigatorKey.currentState.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  @override
  Future<dynamic> popAllAndPushNamed(
    String routeName, {
    Object arguments,
  }) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  @override
  void pop({returnValue}) {
    navigatorKey.currentState.pop(returnValue);
  }
}
