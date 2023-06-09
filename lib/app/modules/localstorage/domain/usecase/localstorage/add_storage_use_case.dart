import 'package:qz_gpt/app/modules/localstorage/domain/local_storage_repository.dart';

class AddStorageUseCase {
  final LocalStorageRepository localStorageRepository;

  AddStorageUseCase({
    required this.localStorageRepository,
  });

  Future<void> call(String key, List<String> value) async {
    try {
      await localStorageRepository.add(key, value);
    } catch (_) {
      rethrow;
    }
  }
}
