import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectivityHelper {
  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityResult> _connectivityStreamController =
      StreamController<ConnectivityResult>.broadcast();

  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivityStreamController.stream;

  ConnectivityHelper() {
    _initConnectivity();
    _connectivity.onConnectivityChanged.listen((result) {
      _connectivityStreamController.add(result.first);
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _connectivityStreamController.add(result.first);
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
    }
  }

  void dispose() {
    _connectivityStreamController.close();
  }
}
