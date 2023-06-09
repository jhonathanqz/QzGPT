import 'package:flutter/material.dart';

class ChatField extends StatefulWidget {
  const ChatField({
    super.key,
    required this.onMessage,
    this.sendEnabled = false,
  });

  final Function(String) onMessage;
  final bool sendEnabled;

  @override
  State<ChatField> createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  _senderMessage() {
    if (widget.sendEnabled) {
      final message = _controller.text;
      if (message.isNotEmpty) {
        widget.onMessage(message);
        _controller.text = '';
      }
    }
    _focusNode.requestFocus();
  }

  bool get isButtonEnabled => _controller.text.isNotEmpty && widget.sendEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onSubmitted: (_) {
          _senderMessage();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
          hintText: 'Pergunte...',
          suffixIcon: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return IconButton(
                onPressed: !isButtonEnabled ? null : _senderMessage,
                icon: const Icon(
                  Icons.send,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
