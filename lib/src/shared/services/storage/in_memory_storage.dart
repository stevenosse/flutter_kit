import 'package:flutter_kit/src/shared/services/storage/storage.dart';

class InMemoryStorage extends Storage {
  final Map<String, Object?> _storage = {};

  @override
  Future<void> init() async {}

  @override
  Future<void> clear() async => _storage.clear();

  @override
  Future<void> write({required String key, required Object value}) async => _storage[key] = value;

  @override
  Future<Object?> read({required String key}) async => _storage[key];

  @override
  Future<void> remove({required String key}) async => _storage.remove(key);
}
