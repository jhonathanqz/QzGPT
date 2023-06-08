import 'dart:async';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:rxdart/rxdart.dart';

import 'package:qz_gpt/app/modules/localstorage/presentation/localstorage/mobx/db.store.dart';
import 'package:qz_gpt/src/atom/chat_atom.dart';
import 'package:qz_gpt/src/common/constants.dart';
import 'package:qz_gpt/src/controller/chat_controller.dart';
import 'package:qz_gpt/src/models/chat_model.dart';

class ChatReducer extends RxReducer {
  ChatGpt chatGPT = ChatGpt(apiKey: AppToken.apiToken);
  //final chatGPT =
  //    ChatGpt(apiKey: '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');
  ChatReducer() {
    on(() => [sendMessageAction.value], sendMessage);
  }

  void sendMessage() async {
    try {
      final message = sendMessageAction.value;

      if (message.isEmpty) {
        return;
      }

      chatLoading.value = true;
      if (AppToken.apiToken.trim() == '') {
        final controller = Modular.get<DBStore>();
        final response = await controller.get('api_token');
        if (response.isEmpty) {
          chatLoading.value = false;
          chatsState.call();
          Modular.to.navigate('/settings/');
          return;
        }
        AppToken.apiToken = response.first;
        chatGPT = ChatGpt(apiKey: AppToken.apiToken);
      }

      chatsState.value.insert(0, ChatModel(text: message, isSender: true));
      chatsState.value.insert(0, ChatModel(text: '...', isSender: false));
      chatsState.call();

      final request = CompletionRequest(
        stream: true,
        maxTokens: 4000,
        model: ChatGptModel.gpt35Turbo,
        messages: [
          Message(role: Role.user.name, content: message),
        ],
      );

      final stream = await chatGPT.createChatCompletionStream(request);

      if (stream == null) {
        chatLoading.value = false;
        return;
      }

      final completer = Completer();
      final buffer = StringBuffer();

      final sup =
          stream.interval(const Duration(milliseconds: 150)).listen((event) {
        if (event.streamMessageEnd) {
          chatLoading.value = false;
          completer.complete();
        }

        final buffedMessage = event.choices?.first.delta?.content ?? '';
        buffer.write(buffedMessage);
        chatsState.value[0] =
            chatsState.value[0].copyWith(text: buffer.toString());
        chatsState.call();
      });

      await completer.future;
      await sup.cancel();
    } catch (e) {
      print('*****Erro: $e');
      chatLoading.value = false;
      chatsState.call();
      final chatController = Modular.get<ChatController>();
      chatController.setError(e.toString());
    }
  }
}
