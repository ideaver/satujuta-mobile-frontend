import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';

class SignUpViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();
}
