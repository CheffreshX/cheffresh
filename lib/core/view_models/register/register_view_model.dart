import 'dart:io';

import 'package:cheffresh/core/view_models/base_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegisterViewModel extends BaseModel {
  Future<void> register(
    LatLng location,
    Map<String, dynamic> form,
    File image,
  ) async {
    await _uploadFile(image, form['Name']).then((value) {
      print(value);
    });
  }

  Future<String> _uploadFile(File file, String filename) async {
    StorageReference storageReference;
    storageReference = FirebaseStorage.instance.ref().child('images/$filename');
     var uploadTask = storageReference.putFile(file);
    var downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    return url;
  }
}
