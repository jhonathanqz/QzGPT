import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'package:qz_gpt/app/app_module.dart';
import 'package:qz_gpt/app/modules/home/pages/home_page.dart';
import 'package:qz_gpt/src/reducers/chat_reducer.dart';

void main() {
  runApp(
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/splash/');
    //reducer;
    return MaterialApp.router(
      title: 'QzGPT',
      theme: materialThemeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      //home: const HomePage(),
    );
  }

  static ThemeData get materialThemeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
