import 'package:cheffresh/core/models/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Model', () {
    test('mapping login request to json', () {
      //mocking the mobile side
      final userModel = User((UserBuilder b) => b
        ..name = 'user@test.com'
        ..reservations.addAll(['John', 'Sophia', 'Dave', 'Linda']));
//
//      var copiedUserModel = userModel.rebuild((b) => b
//        ..phone = '0123123');
//
      print(userModel);
//      print(copiedUserModel);

      final userModelJson = userModel.toJson();
      print(userModelJson);

      final userModelFromJson = User.fromJson(userModelJson);
      print(userModelFromJson);
    });
  });
}
