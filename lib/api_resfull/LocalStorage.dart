import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final _storage = GetStorage();

  void clearDataStorage() {
    _storage.erase();
  }

  dynamic getStorageByKey(String typeDataStorage) {
    return _storage.read(typeDataStorage);
  }

  dynamic createStorageByKey(String typeDataStorage,value) {
    return _storage.write(typeDataStorage, value);
  }

  dynamic removeStorageByKey(String typeDataStorage) {
    return _storage.remove(typeDataStorage);
  }
}