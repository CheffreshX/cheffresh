import 'package:cheffresh/core/constants/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthApi {
  void SignUp(String uid, data) {
    //uid = authResult.user.uid
    Firestore.instance
        .collection(FirestorePaths.USER_PATH)
        .document(uid)
        .setData(data.toJson());
  }
}
