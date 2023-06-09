import 'package:rx_notifier/rx_notifier.dart';

import 'package:qz_gpt/src/models/chat_model.dart';

//Atoms
final chatsState = RxNotifier<List<ChatModel>>([]);
final chatLoading = RxNotifier(false);

//action
final sendMessageAction = RxNotifier<String>('');
