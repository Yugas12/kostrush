import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class StoragePreference {
  StoragePreference(this.storage, this.storageLogger);

  final FlutterSecureStorage storage;
  final Logger storageLogger;

  Future<void> writeSecureData(String key, String value) {
    storageLogger.d('writing for data from key $key');
    var writeData = storage.write(
        key: key, value: value, iOptions: IOSOptions.defaultOptions);
    return writeData;
  }

  Future<String?> readSecureData(String key) {
    storageLogger.d('asking for data from key $key');

    var readData = storage.read(key: key, iOptions: IOSOptions.defaultOptions);
    return readData;
  }

  Future<void> deleteSecureData(String key) {
    storageLogger.d('deleting for data from key $key');

    var deleteData =
        storage.delete(key: key, iOptions: IOSOptions.defaultOptions);
    return deleteData;
  }
}
