import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qz_gpt/src/controller/chat_controller.dart';

import 'package:qz_gpt/src/widgets/chat_bubble.dart';
import 'package:qz_gpt/src/widgets/chat_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ChatController _controller;

  @override
  void initState() {
    _controller = Modular.get();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = Modular.get();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
              itemCount: _controller.chatModels.length,
              itemBuilder: (context, index) {
                final chat = _controller.chatModels[index];
                return ChatBubble(
                  chatModel: chat,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ChatField(
                sendEnabled: !_controller.isLoading,
                onMessage: _controller.sendMessage,
              ),
            ),
            Visibility(
              visible: _controller.isLoading,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
