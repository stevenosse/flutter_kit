import 'package:flutter_kit/src/shared/services/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends Storage {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async => _sharedPreferences = await SharedPreferences.getInstance();

  @override
  Future<void> clear() async => await _sharedPreferences.clear();

  @override
  Future<Object?> read({required String key}) async => _sharedPreferences.get(key);

  @override
  Future<void> remove({required String key}) async => await _sharedPreferences.remove(key);

  @override
  Future<void> write({required String key, required Object value}) async =>
      await _sharedPreferences.setString(key, value.toString());
}
