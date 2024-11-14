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
      title: 'Ejercicio 22 Pagina 64',
      debugShowCheckedModeBanner: false, // QUITAR LA MARCA DEL DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 22 Pagina 64'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

      ),
    );
  }
}