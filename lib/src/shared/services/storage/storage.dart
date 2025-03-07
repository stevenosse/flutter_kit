abstract class Storage {
  /// Initialize the storage service
  Future<void> init();

  /// Clear all data from storage
  Future<void> clear();

  /// Remove a specific key from storage
  Future<void> remove({required String key});

  /// Check if a key exists in storage
  Future<bool> containsKey({required String key});

  /// Get all keys in storage
  Future<Set<String>> getKeys();

  /// Read a value from storage
  Future<T?> read<T>({required String key});

  /// Write a string value to storage
  Future<bool> writeString({required String key, required String value});

  /// Write an integer value to storage
  Future<bool> writeInt({required String key, required int value});

  /// Write a double value to storage
  Future<bool> writeDouble({required String key, required double value});

  /// Write a boolean value to storage
  Future<bool> writeBool({required String key, required bool value});

  /// Write a list of strings to storage
  Future<bool> writeStringList({required String key, required List<String> value});

  /// Write any value to storage (convenience method)
  /// Note: This will attempt to determine the type and use the appropriate method
  /// For complex objects, consider using JSON serialization before storing
  Future<bool> write({required String key, required value});
}
