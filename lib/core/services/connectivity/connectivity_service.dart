import 'dart:async'; //For StreamController/Stream
import 'dart:io'; //InternetAddress utility

import 'package:cheffresh/ui/shared/dialogs.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  ConnectivityService._internal();

  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectivityService _singleton = ConnectivityService._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectivityService getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController.broadcast();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    final previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    //  if (!hasConnection) showNoInternetConnectionSnackbar();
    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}

bool hasInternetConnection() {
  final connectionStatus = ConnectivityService.getInstance();
  if (!connectionStatus.hasConnection) {
    displayDialog('No internet connection');
    return false;
  }
  return true;
}
