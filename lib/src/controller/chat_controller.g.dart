// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatController on _ChatControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ChatControllerBase.isLoading', context: context);

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

  late final _$chatModelsAtom =
      Atom(name: '_ChatControllerBase.chatModels', context: context);

  @override
  List<ChatModel> get chatModels {
    _$chatModelsAtom.reportRead();
    return super.chatModels;
  }

  @override
  set chatModels(List<ChatModel> value) {
    _$chatModelsAtom.reportWrite(value, super.chatModels, () {
      super.chatModels = value;
    });
  }

  late final _$isFinishResponseAtom =
      Atom(name: '_ChatControllerBase.isFinishResponse', context: context);

  @override
  bool get isFinishResponse {
    _$isFinishResponseAtom.reportRead();
    return super.isFinishResponse;
  }

  @override
  set isFinishResponse(bool value) {
    _$isFinishResponseAtom.reportWrite(value, super.isFinishResponse, () {
      super.isFinishResponse = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_ChatControllerBase.sendMessage', context: context);

  @override
  Future<void> sendMessage(String message) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(message));
  }

  late final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase', context: context);

  @override
  void wipeStore() {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.wipeStore');
    try {
      return super.wipeStore();
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
chatModels: ${chatModels},
isFinishResponse: ${isFinishResponse}
    ''';
  }
}
