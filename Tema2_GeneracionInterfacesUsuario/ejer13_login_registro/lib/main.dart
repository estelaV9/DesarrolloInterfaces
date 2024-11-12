import 'package:flutter/material.dart';

/*EJERCICIO 13: Diseña una pantalla de bienvenida con un texto, una breve descripción
y botones de Login y Registro. Usa “SingleChildScrollView” para hacerla
desplazable en caso de que tengamos pantallas pequeñas. Añade mucho
texto para comprobarlo*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 13 Pagina 52',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 13 Pagina 52'),
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
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ejercicio 13 Pagina 52", style: TextStyle(fontSize: 24),),
      ),
      body: Center(

      ),
    );
  }
}