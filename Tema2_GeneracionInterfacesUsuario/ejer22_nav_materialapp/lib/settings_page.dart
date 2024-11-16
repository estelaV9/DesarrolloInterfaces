import 'package:flutter/material.dart';
// PANTALLA DE SETTINGS
class SettingsPage extends StatelessWidget{
  final String title;
  SettingsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonStyle = const TextStyle(fontSize: 24);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Home", style: buttonStyle),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/perfil');
              },
              child: Text("Profile", style: buttonStyle),
            ),
          ],
        ),
      ),
    );
  }
}