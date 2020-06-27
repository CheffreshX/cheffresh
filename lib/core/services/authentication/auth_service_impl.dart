import '../../../locator_setup.dart';
import 'auth_api.dart';
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  AuthApi api = locator<AuthApi>();
}
