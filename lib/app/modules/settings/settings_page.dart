import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:qz_gpt/app/modules/settings/settings_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsStore controller;
  final _fieldController = TextEditingController();
  @override
  void initState() {
    controller = Modular.get();
    initController();
    super.initState();
  }

  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }

  initController() async {
    await controller.getApiKeyDatabase();
    _fieldController.text = controller.apiKeyField;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Configurações',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          height: size.height,
          width: size.width,
          child: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Insira abaixo a sua chave API do ChatGPT'),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _fieldController,
                        onChanged: controller.setApiKey,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Sua API KEY',
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller.saveApiKey();
                              },
                              child: const Text('Salvar'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
