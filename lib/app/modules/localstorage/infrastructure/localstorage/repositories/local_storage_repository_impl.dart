import 'package:qz_gpt/app/modules/localstorage/domain/local_storage_repository.dart';
import 'package:qz_gpt/app/modules/localstorage/infrastructure/localstorage/repositories/contracts/local_storage_provider.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageProvider localStorageProvider;

  LocalStorageRepositoryImpl({
    required this.localStorageProvider,
  });

  @override
  Future<List<String>> get(String key) async {
    try {
      return await localStorageProvider.get(key);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> put(String key, List<String> value) async {
    try {
      return await localStorageProvider.put(key, value);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      return await localStorageProvider.delete(key);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> add(String key, List<String> value) async {
    try {
      return await localStorageProvider.add(key, value);
    } catch (_) {
      rethrow;
    }
  }
}
