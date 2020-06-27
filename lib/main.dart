import 'package:cheffresh/ui/router.dart';
import 'package:cheffresh/ui/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'core/services/connectivity/connectivity_service.dart';
import 'core/services/navigation/navigation_service.dart';
import 'google_fonts_setup.dart';
import 'locator_setup.dart';
import 'provider_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGoogleFont();
  final connectionStatus = ConnectivityService.getInstance();
  connectionStatus.initialize();

  await setupLocator();
//  runApp(DevicePreview(
//    enabled: kDebugMode,
//    builder: (_) => MyApp(
//    ),
//  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: GetMaterialApp(
          title: 'Cheffresh',
          theme: mainTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationService.navigatorKey,
          initialRoute: initialRoute,
          routes: Router.routes(),
        ));
  }
}