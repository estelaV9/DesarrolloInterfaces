import 'package:flutter/material.dart';
// PANTALLA DE SETTINGS
class SettingsPage extends StatelessWidget{
  final String title;
  // DEFINIR EL ESTILO PARA LOS TEXTOS DE UN TAMAÑO DE 24
  TextStyle style = const TextStyle(fontSize: 24);
  SettingsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title, style: style),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(

      ),
    );
  }
}