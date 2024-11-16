import 'package:flutter/material.dart';
// PANTALLA DE PERFIL
class ProfilePage extends StatelessWidget{
  final String title;

  const ProfilePage({super.key, required this.title});

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
                Navigator.pushNamed(context, '/ajustes');
              },
              child: Text("Settings", style: buttonStyle),
            ),
          ],
        ),
      ),
    );
  }
}