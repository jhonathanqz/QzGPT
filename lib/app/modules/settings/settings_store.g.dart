// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SettingsStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$apiKeyFieldAtom =
      Atom(name: '_SettingsStoreBase.apiKeyField', context: context);

  @override
  String get apiKeyField {
    _$apiKeyFieldAtom.reportRead();
    return super.apiKeyField;
  }

  @override
  set apiKeyField(String value) {
    _$apiKeyFieldAtom.reportWrite(value, super.apiKeyField, () {
      super.apiKeyField = value;
    });
  }

  late final _$getApiKeyDatabaseAsyncAction =
      AsyncAction('_SettingsStoreBase.getApiKeyDatabase', context: context);

  @override
  Future<void> getApiKeyDatabase() {
    return _$getApiKeyDatabaseAsyncAction.run(() => super.getApiKeyDatabase());
  }

  late final _$saveApiKeyAsyncAction =
      AsyncAction('_SettingsStoreBase.saveApiKey', context: context);

  @override
  Future<void> saveApiKey() {
    return _$saveApiKeyAsyncAction.run(() => super.saveApiKey());
  }

  late final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase', context: context);

  @override
  void setApiKey(String value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setApiKey');
    try {
      return super.setApiKey(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipeStore() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.wipeStore');
    try {
      return super.wipeStore();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
apiKeyField: ${apiKeyField}
    ''';
  }
}
