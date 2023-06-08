import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:qz_gpt/app/modules/localstorage/presentation/localstorage/mobx/db.store.dart';
import 'package:qz_gpt/src/common/constants.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  bool isLoading = false;

  final _dbController = Modular.get<DBStore>();

  @action
  Future<void> dismmiss() async {
    await Future.delayed(const Duration(seconds: 2));
    final _key = await _dbController.get('api_key');
    if (_key.isEmpty) {
      Modular.to.navigate('/settings/');
      return;
    }
    AppToken.apiToken = _key.first;
    Modular.to.navigate('/home/');
  }

  @action
  void wipeStore() {
    isLoading = false;
  }
}
