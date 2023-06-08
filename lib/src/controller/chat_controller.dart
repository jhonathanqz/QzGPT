import 'dart:async';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:mobx/mobx.dart';

import 'package:qz_gpt/src/models/chat_model.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  String errorMessage = '';

  @action
  void setError(String message) {
    isError = true;
    errorMessage = message;
  }

  StreamSubscription? stream;

  @observable
  List<ChatModel> chatModels = [];

  @observable
  bool isFinishResponse = false;

  @action
  Future<void> sendMessage(String message) async {
    try {
      final chatGPT = ChatGpt(
          apiKey: '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');
      isLoading = true;

      chatModels.insert(0, ChatModel(text: message, isSender: true));
      chatModels.insert(0, ChatModel(text: '...', isSender: false));

      // ignore: no_leading_underscores_for_local_identifiers
      final _request = CompletionRequest(
        stream: true,
        maxTokens: 4000,
        model: ChatGptModel.gpt35Turbo,
        messages: [
          Message(role: Role.user.name, content: message),
        ],
      );

      // ignore: no_leading_underscores_for_local_identifiers
      final _stream = await chatGPT.createChatCompletionStream(_request);

      if (_stream == null) {
        return;
      }

      final buffer = StringBuffer();

      stream = _stream.listen((event) async {
        if (event.streamMessageEnd) {
          isLoading = false;
          isFinishResponse = true;
          //acabei de receber
        }
        final buffedMessage = event.choices?.first.delta?.content ?? '';
        await Future.delayed(const Duration(milliseconds: 500));
        buffer.write(buffedMessage);

        chatModels[0] = chatModels[0].copyWith(text: buffer.toString());
        desactiveStream();
      });
    } catch (e) {}
  }

  Future<void> desactiveStream() async {
    if (isFinishResponse) {
      if (stream != null) {
        await stream!.cancel();
        isFinishResponse = false;
        //stream = null;
      }
    }
  }

  @action
  void wipeStore() {
    isLoading = false;
  }
}
