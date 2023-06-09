import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:qz_gpt/app/modules/localstorage/presentation/localstorage/mobx/db.store.dart';
import 'package:qz_gpt/src/common/constants.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final dbController = Modular.get<DBStore>();
  @observable
  bool isLoading = false;

  @observable
  String apiKeyField = '';

  @action
  void setApiKey(String value) => apiKeyField = value;

  @action
  Future<void> getApiKeyDatabase() async {
    try {
      isLoading = true;
      final response = await dbController.get('api_key');
      if (response.isNotEmpty) {
        apiKeyField = response.first;
      }
    } catch (e) {}
    isLoading = false;
  }

  @action
  Future<void> saveApiKey() async {
    try {
      if (apiKeyField.trim() == '') {
        return;
      }
      isLoading = true;
      await dbController.put('api_key', [apiKeyField]);
      AppToken.apiToken = apiKeyField;
      isLoading = false;
      Modular.to.navigate('/home/');
    } catch (e) {}
    isLoading = false;
  }

  @action
  void wipeStore() {
    isLoading = false;
  }
}
