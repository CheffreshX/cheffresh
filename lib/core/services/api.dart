import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final Firestore _db = Firestore.instance;

  Future<QuerySnapshot> getDataCollection(String path) {
    var ref = _db.collection(path);
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection(String path) {
    var ref = _db.collection(path);
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id, String path) {
    var ref = _db.collection(path);
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id, String path) {
    var ref = _db.collection(path);
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data, String path) {
    var ref = _db.collection(path);
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id, String path) {
    var ref = _db.collection(path);
    return ref.document(id).updateData(data);
  }
}
