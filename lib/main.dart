import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qz_gpt/app/app_module.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    return MaterialApp.router(
      title: 'Qz GPT',
      theme: materialThemeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }

  static ThemeData get materialThemeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue.shade900,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
