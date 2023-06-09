import 'package:qz_gpt/app/modules/localstorage/domain/local_storage_repository.dart';

class GetStorageUseCase {
  final LocalStorageRepository localStorageRepository;

  GetStorageUseCase({
    required this.localStorageRepository,
  });

  Future<List<String>> call(String key) async {
    try {
      return await localStorageRepository.get(key);
    } catch (_) {
      rethrow;
    }
  }
}
