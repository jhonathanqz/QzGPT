import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String text;
  final bool isSender;

  ChatModel({
    required this.text,
    required this.isSender,
  });

  ChatModel copyWith({
    String? text,
    bool? isSender,
  }) {
    return ChatModel(
      text: text ?? this.text,
      isSender: isSender ?? this.isSender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'isSender': isSender,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      text: map['text'] as String,
      isSender: map['isSender'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatModel(text: $text, isSender: $isSender)';
}
