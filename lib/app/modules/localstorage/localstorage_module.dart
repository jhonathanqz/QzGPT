import 'package:flutter_modular/flutter_modular.dart';
import 'package:qz_gpt/app/modules/localstorage/data/localstorage/provider/local_storage_provider_impl.dart';
import 'package:qz_gpt/app/modules/localstorage/domain/local_storage_repository.dart';
import 'package:qz_gpt/app/modules/localstorage/domain/usecase/localstorage/add_storage_use_case.dart';
import 'package:qz_gpt/app/modules/localstorage/domain/usecase/localstorage/delete_storage_use_case.dart';
import 'package:qz_gpt/app/modules/localstorage/domain/usecase/localstorage/get_storage_use_case.dart';
import 'package:qz_gpt/app/modules/localstorage/domain/usecase/localstorage/put_storage_use_case.dart';
import 'package:qz_gpt/app/modules/localstorage/infrastructure/localstorage/repositories/local_storage_repository_impl.dart';

import 'infrastructure/localstorage/repositories/contracts/local_storage_provider.dart';
import 'presentation/localstorage/mobx/db.store.dart';

class LocalstorageModule extends Module {
  @override
  final List<Bind> binds = [
    //* Setup provider*/
    Bind.lazySingleton<LocalStorageProvider>(
      (i) => LocalStorageProviderImpl(),
      export: true,
    ),

    //* Setup Repository*/
    Bind.lazySingleton<LocalStorageRepository>(
      (i) => LocalStorageRepositoryImpl(
        localStorageProvider: i<LocalStorageProvider>(),
      ),
      export: true,
    ),

    //* Setup useCase*/
    Bind.lazySingleton<AddStorageUseCase>(
      (i) => AddStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
      export: true,
    ),

    Bind.lazySingleton<DeleteStorageUseCase>(
      (i) => DeleteStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
      export: true,
    ),

    Bind.lazySingleton<GetStorageUseCase>(
      (i) => GetStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
      export: true,
    ),

    Bind.lazySingleton<PutStorageUseCase>(
      (i) => PutStorageUseCase(
        localStorageRepository: i<LocalStorageRepository>(),
      ),
      export: true,
    ),

    //* Setup store*/
    Bind.singleton<DBStore>(
      (i) => DBStore(
        addStorageUseCase: i<AddStorageUseCase>(),
        getStorageUseCase: i<GetStorageUseCase>(),
        deleteStorageUseCase: i<DeleteStorageUseCase>(),
        putStorageUseCase: i<PutStorageUseCase>(),
      ),
      export: true,
    ),
  ];

  @override
  final List<ModularRoute> routes = [];
}
