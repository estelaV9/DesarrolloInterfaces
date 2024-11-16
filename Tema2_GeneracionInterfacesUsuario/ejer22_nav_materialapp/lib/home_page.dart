import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // SE DEFINEN LAS RUTAS DE Home, Perfil y Ajustes
      routes: {
        '/': (context) => const HomePage(title: 'Pantalla Home'), // RUTA INICIAL
        '/perfil': (context) => ProfilePage(title: 'Pantalla Perfil'), // RUTA PERFIL
        '/ajustes': (context) => SettingsPage(title: 'Pantalla Ajustes',), // RUTA PERFIL
      },
      title: 'Ejercicio 22 Pagina 64',
      debugShowCheckedModeBanner: false, // QUITAR LA MARCA DEL DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonStyle = const TextStyle(fontSize: 24);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title, style: buttonStyle),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/perfil'); // IR A LA PAGINA PERFIL
            }, child: Text("Profile Page", style: buttonStyle)),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/ajustes'); // IR A LA PAGINA AJUSTES
            }, child: Text("Settings Page", style: buttonStyle))
          ],
        ),
      ),
    );
  }
}