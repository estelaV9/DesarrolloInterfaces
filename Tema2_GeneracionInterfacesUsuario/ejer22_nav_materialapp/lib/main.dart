import 'package:flutter/material.dart';

/*EJERCICIO 22: Define tres rutas: Home, Perfil y Ajustes en MaterialApp. Implementa
navegación entre ellas usando Navigator.pushNamed y botones en cada
pantalla que redirija a una de las otras dos*/

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
      // home: const HomePage(title: 'Ejercicio 22 Pagina 64'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  // DEFINIR EL ESTILO PARA LOS TEXTOS DE UN TAMAÑO DE 24
  TextStyle style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: style),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/perfil'); // IR A LA PAGINA PERFIL
            }, child: const Text("Profile Page", style: TextStyle(fontSize: 24),)),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/ajustes'); // IR A LA PAGINA AJUSTES
            }, child: const Text("Settings Page", style: TextStyle(fontSize: 24),))
          ],
        ),
      ),
    );
  }
}

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


// PANTALLA DE PERFIL
class ProfilePage extends StatelessWidget{
  final String title;
  // DEFINIR EL ESTILO PARA LOS TEXTOS DE UN TAMAÑO DE 24
  TextStyle style = const TextStyle(fontSize: 24);
  ProfilePage({super.key, required this.title});

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