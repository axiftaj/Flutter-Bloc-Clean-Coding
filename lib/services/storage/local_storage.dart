import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Importing FlutterSecureStorage for secure local storage

/// A class for managing local storage using FlutterSecureStorage.
class LocalStorage {
  /// Instance of FlutterSecureStorage for secure local storage.
  final storage = const FlutterSecureStorage();

  /// Sets a key-value pair in the local storage.
  ///
  /// Returns a Future<bool> indicating the success of the operation.
  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  /// Reads the value associated with the given key from the local storage.
  ///
  /// Returns a Future<dynamic> representing the value stored for the key.
  Future<dynamic> readValue(String key) async {
    return await storage.read(key: key);
  }

  /// Clears the value associated with the given key from the local storage.
  ///
  /// Returns a Future<bool> indicating the success of the operation.
  Future<bool> clearValue(String key) async {
    await storage.delete(key: key);
    return true;
  }
}
