import 'package:cheffresh/core/services/firestore_functions.dart';
import 'package:cheffresh/core/view_models/base_model.dart';

class OrdersViewModel extends BaseModel {
  Future<void> onReady(FirestoreFunctions firestoreProvider) async {
    setBusy(true);
    await firestoreProvider.fetchOrders();
    setBusy(false);
  }
}
