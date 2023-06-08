import 'package:flutter/material.dart';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';

import 'package:qz_gpt/src/models/chat_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    if (chatModel.isSender) {
      return BubbleSpecialThree(
        text: chatModel.text,
        color: Colors.blue,
        tail: false,
        textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        isSender: chatModel.isSender,
      );
    }
    return BubbleSpecialThree(
      text: chatModel.text,
      color: Colors.grey,
      tail: false,
      //textStyle: const TextStyle(color: Colors.white, fontSize: 16),
      isSender: chatModel.isSender,
    );
  }
}
