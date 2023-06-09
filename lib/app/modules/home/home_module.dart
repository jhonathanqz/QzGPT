import 'package:flutter_modular/flutter_modular.dart';

import 'package:qz_gpt/app/modules/home/pages/home_page.dart';
import 'package:qz_gpt/src/controller/chat_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => ChatController(),
      export: true,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
