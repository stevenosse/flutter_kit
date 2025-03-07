import 'dart:convert';

import 'package:flutter_kit/src/shared/services/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends Storage {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async => _sharedPreferences = await SharedPreferences.getInstance();

  @override
  Future<void> clear() async => await _sharedPreferences.clear();

  @override
  Future<bool> containsKey({required String key}) async => _sharedPreferences.containsKey(key);

  @override
  Future<Set<String>> getKeys() async => _sharedPreferences.getKeys();

  @override
  Future<T?> read<T>({required String key}) async {
    // If key doesn't exist, return null
    if (!_sharedPreferences.containsKey(key)) return null;

    // Handle different types based on T
    if (T == String) {
      return _sharedPreferences.getString(key) as T?;
    } else if (T == int) {
      return _sharedPreferences.getInt(key) as T?;
    } else if (T == double) {
      return _sharedPreferences.getDouble(key) as T?;
    } else if (T == bool) {
      return _sharedPreferences.getBool(key) as T?;
    } else if (T == List<String>) {
      return _sharedPreferences.getStringList(key) as T?;
    } else {
      // For complex types, try to parse from JSON string
      final value = _sharedPreferences.getString(key);
      if (value == null) return null;
      try {
        return jsonDecode(value) as T?;
      } catch (e) {
        return value as T?;
      }
    }
  }

  @override
  Future<void> remove({required String key}) async => await _sharedPreferences.remove(key);

  @override
  Future<bool> write({required String key, required value}) async {
    if (value == null) {
      return await _sharedPreferences.remove(key);
    } else if (value is String) {
      return await writeString(key: key, value: value);
    } else if (value is int) {
      return await writeInt(key: key, value: value);
    } else if (value is double) {
      return await writeDouble(key: key, value: value);
    } else if (value is bool) {
      return await writeBool(key: key, value: value);
    } else if (value is List<String>) {
      return await writeStringList(key: key, value: value);
    } else {
      // For complex objects, serialize to JSON
      try {
        final jsonString = jsonEncode(value);
        return await writeString(key: key, value: jsonString);
      } catch (e) {
        // Fallback to toString if JSON serialization fails
        return await writeString(key: key, value: value.toString());
      }
    }
  }

  @override
  Future<bool> writeBool({required String key, required bool value}) async =>
      await _sharedPreferences.setBool(key, value);

  @override
  Future<bool> writeDouble({required String key, required double value}) async =>
      await _sharedPreferences.setDouble(key, value);

  @override
  Future<bool> writeInt({required String key, required int value}) async => await _sharedPreferences.setInt(key, value);

  @override
  Future<bool> writeString({required String key, required String value}) async =>
      await _sharedPreferences.setString(key, value);

  @override
  Future<bool> writeStringList({required String key, required List<String> value}) async =>
      await _sharedPreferences.setStringList(key, value);
}
