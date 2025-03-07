import 'dart:convert';

import 'package:flutter_kit/src/shared/services/storage/storage.dart';

class InMemoryStorage extends Storage {
  final Map<String, Object?> _storage = {};

  @override
  Future<void> init() async {}

  @override
  Future<void> clear() async => _storage.clear();

  @override
  Future<bool> containsKey({required String key}) async => _storage.containsKey(key);

  @override
  Future<Set<String>> getKeys() async => _storage.keys.toSet();

  @override
  Future<T?> read<T>({required String key}) async {
    final value = _storage[key];
    if (value == null) return null;

    if (value is T) {
      return value as T?;
    } else if (T == String && value is! String) {
      return value.toString() as T?;
    } else if (value is String) {
      // Try to decode JSON for complex types
      try {
        final decoded = jsonDecode(value);
        return decoded as T?;
      } catch (_) {
        // If not valid JSON, return as is if possible
        return value as T?;
      }
    } else {
      return value as T?;
    }
  }

  @override
  Future<void> remove({required String key}) async => _storage.remove(key);

  @override
  Future<bool> write({required String key, required value}) async {
    _storage[key] = value;
    return true;
  }

  @override
  Future<bool> writeBool({required String key, required bool value}) async {
    _storage[key] = value;
    return true;
  }

  @override
  Future<bool> writeDouble({required String key, required double value}) async {
    _storage[key] = value;
    return true;
  }

  @override
  Future<bool> writeInt({required String key, required int value}) async {
    _storage[key] = value;
    return true;
  }

  @override
  Future<bool> writeString({required String key, required String value}) async {
    _storage[key] = value;
    return true;
  }

  @override
  Future<bool> writeStringList({required String key, required List<String> value}) async {
    _storage[key] = value;
    return true;
  }
}
