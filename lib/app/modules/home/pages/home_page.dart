import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'package:qz_gpt/src/atom/chat_atom.dart';
import 'package:qz_gpt/src/controller/chat_controller.dart';
import 'package:qz_gpt/src/helper/snack_helper.dart';
import 'package:qz_gpt/src/reducers/chat_reducer.dart';
import 'package:qz_gpt/src/widgets/chat_bubble.dart';
import 'package:qz_gpt/src/widgets/chat_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ReactionDisposer errorDisposer;
  late ChatController chatController;
  final reducer = ChatReducer();

  @override
  void initState() {
    reducer;
    chatController = Modular.get();
    errorDisposer = reaction(
      (_) => chatController.isError,
      (_) {
        if (chatController.isError) {
          chatController.isError = false;
          SnackHelper.showSnackInformation(
            chatController.errorMessage != ''
                ? chatController.errorMessage
                : 'Erro. Por favor verifique sua chave de API',
            Colors.red.shade600,
            context,
            seconds: 5,
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    errorDisposer.call();
    super.dispose();
  }

  void _sendMessage(String message) {
    sendMessageAction.value = message;
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [chatsState.value, chatLoading.value]);

    final chatModels = chatsState.value;
    final isLoading = chatLoading.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('QzGPT'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed('/settings/');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            child: Image.asset('assets/logo.png'),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            reverse: true,
            itemCount: chatModels.length,
            itemBuilder: (context, index) {
              final chat = chatModels[index];
              return ChatBubble(
                chatModel: chat,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatField(
              sendEnabled: !isLoading,
              onMessage: _sendMessage,
            ),
          ),
          Visibility(
            visible: isLoading,
            child: const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
