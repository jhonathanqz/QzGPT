import 'package:flutter/material.dart';

import 'package:qz_gpt/src/models/chat_model.dart';
import 'package:qz_gpt/src/widgets/chat_bubble.dart';
import 'package:qz_gpt/src/widgets/chat_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  List<ChatModel> chatModels = [
    ChatModel(text: 'text', isSender: false),
    ChatModel(text: 'text', isSender: false),
    ChatModel(text: 'text', isSender: false),
  ];

  _sendMessage(String message) {
    setState(() {
      chatModels.insert(0, ChatModel(text: message, isSender: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QzGPT'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            child: Icon(
              Icons.rocket,
              size: 300,
              color: Colors.grey.shade200,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            reverse: true,
            itemCount: chatModels.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                chatModel: chatModels[index],
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
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
