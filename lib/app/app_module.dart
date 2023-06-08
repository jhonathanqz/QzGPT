import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qz_gpt/app/modules/home/home_module.dart';
import 'package:qz_gpt/app/modules/localstorage/localstorage_module.dart';
import 'package:qz_gpt/main.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        LocalstorageModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        // ModuleRoute('/register', module: RegisterModule()),
      ];

  @override
  // ignore: override_on_non_overriding_member
  Widget get bootstrap => const App();
}
