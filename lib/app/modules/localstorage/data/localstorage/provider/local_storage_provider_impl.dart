//SitefSettings
import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qz_gpt/app/modules/localstorage/infrastructure/localstorage/repositories/contracts/local_storage_provider.dart';

class LocalStorageProviderImpl implements LocalStorageProvider {
  final Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    String companyName = 'QzGPT975423421';
    var box = await Hive.openBox("db_$companyName");
    _instance.complete(box);
  }

  LocalStorageProviderImpl() {
    _init();
  }

  @override
  Future<List<String>> get(String key) async {
    try {
      var box = await _instance.future;
      var response = await box.get(key);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> put(String key, List<String> value) async {
    try {
      var box = await _instance.future;
      await box.put(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> add(String key, List<String> value) async {
    try {
      var box = await _instance.future;
      await box.put(key, value);
      await box.get(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      var box = await _instance.future;
      await box.delete(key);
    } catch (e) {
      rethrow;
    }
  }
}
