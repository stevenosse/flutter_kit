abstract class Storage {
  Future<void> init();

  Future<void> clear();

  Future<void> write({required String key, required Object value});

  Future<Object?> read({required String key});

  Future<void> remove({required String key});
}