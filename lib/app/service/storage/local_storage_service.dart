import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../model/auth_model.dart';
import '../../utility/console_log.dart';

enum LocalStorageKey {
  userId,
  userAuth,
  user,
}

class LocalStorageService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  LocalStorageService._();

  static const _storage = FlutterSecureStorage();

  static Future<Auth?> readAuthData() async {
    try {
      var data = await _storage.read(key: LocalStorageKey.userAuth.name);

      if (data != null) {
        return Auth.fromJson(json.decode(data));
      } else {
        return null;
      }
    } catch (e) {
      cl("[readAuthData].error $e");
      return null;
    }
  }

  static Future<void> writeAuthData(Auth auth) async {
    await _storage.write(
      key: LocalStorageKey.userAuth.name,
      value: json.encode(auth.toJson()),
    );
  }

  static Future<String?> readData(LocalStorageKey key) async {
    return await _storage.read(key: key.name);
  }

  static Future<Map<String, String>?> readAllData() async {
    return await _storage.readAll();
  }

  static Future<void> writeData(LocalStorageKey key, String value) async {
    return await _storage.write(key: key.name, value: value);
  }

  static Future<void> deleteData(LocalStorageKey key) async {
    return await _storage.delete(key: key.name);
  }

  static Future<void> deleteAllData() async {
    return await _storage.deleteAll();
  }
}
