import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../utility/console_log.dart';

// App Network Checker
// v.2.0.0
// by Elriz Wiraswara

class NetworkCheckerService extends ChangeNotifier {
  bool isConnected = false;

  StreamSubscription<ConnectivityResult>? _subscription;

  Future<void> initNetworkChecker({
    required NavigatorState navigator,
    Function(bool)? onHasInternet,
  }) async {
    isConnected = await InternetConnectionChecker().hasConnection;

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        isConnected = await InternetConnectionChecker().hasConnection;

        if (onHasInternet != null) {
          onHasInternet(isConnected);
        }
      } else {
        isConnected = false;
      }

      notifyListeners();

      cl('[NetworkCheckerService].isConnected = $isConnected ');
    });
  }

  void cancelSubs() {
    _subscription?.cancel();
  }
}
