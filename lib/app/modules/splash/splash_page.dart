import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:qz_gpt/app/modules/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Modular.get<SplashStore>().dismmiss();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.shade700,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo3.png'),
        ],
      ),
    );
  }
}
