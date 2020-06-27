import 'secrets.dart';

const String CUSTOMER_EMAIL = 'email';
const String USER_TOKEN = 'token';
const String CUSTOMER_ADDRESS = 'address';
const String GOOGLE_MAP_API_KEY = '';
const int SEND_TIME_OUT = 5000;
const int RECEIVE_TIME_OUT = 10000;
const int ALL_PRODUCTS = 0;
String authenticationToken;
String refreshToken;
String language = 'en';

Map<String, String> headersWithToken() => {
      'Authorization': 'Bearer $authenticationToken',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

Map<String, String> headersWithRefreshToken() => {
      'Authorization': 'Bearer $refreshToken',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

Map<String, String> headersWithAccessToken() => {
      'Authorization': 'bearer $authenticationToken',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': language
    };

Map<String, String> headersWithoutToken(int length) => {
      'Content-Length': length.toString(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': language
    };

class AuthenticationEndpoint {
  static const String LOGIN = API_ENDPOINT + 'login';
  static const String REGISTER = API_ENDPOINT + 'registration';
  static const String REFRESH_TOKEN = API_ENDPOINT + 'refresh';
  static const String RESET_PASSWORD = API_ENDPOINT + 'reset';
  static const String LOGOUT_REFRESH_TOKEN = API_ENDPOINT + 'logout/refresh';
  static const String LOGOUT_ACCESS_TOKEN = API_ENDPOINT + 'logout/access';
}

class DemoEndPoint {
  static const String DEMO = API_ENDPOINT + 'link';
}

class LookUpEndpoint {}
