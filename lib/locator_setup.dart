import 'package:cheffresh/core/constants/firebase_constants.dart';
import 'package:cheffresh/core/services/api.dart';
import 'package:get_it/get_it.dart';

import 'core/services/authentication/auth_api.dart';
import 'core/services/authentication/auth_service.dart';
import 'core/services/authentication/auth_service_impl.dart';
import 'core/services/firestore_functions.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/services/navigation/navigation_service_impl.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
Future<void> setupLocator() async {
  //Apis
  locator.registerLazySingleton<AuthApi>(() => AuthApi());

  // Services
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());

  // Firestore
  //locator.registerLazySingleton(() => Api(FirestorePaths.USER_PATH));
  locator.registerLazySingleton(() => Api(FirestorePaths.RESERVATION_PATH));
  locator.registerLazySingleton(() => FirestoreFunctions());
}
