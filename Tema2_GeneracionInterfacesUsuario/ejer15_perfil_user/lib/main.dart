import 'package:flutter/material.dart';
/*EJERCICIO 15: .Diseña una pantalla de perfil de usuario usando Stack para mostrar
una imagen de portada (fondo), un avatar redondeado superpuesto a la izquierda,
y el nombre del usuario a la derecha.
1. Añade un formulario debajo que permita editar los textos, guardarlos y que
cambien.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 15 Pagina 52',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 15 Pagina 52'),
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
        title: const Text("Ejercicio 15 Pagina 52", style: TextStyle(fontSize: 24),),
      ),
      body: Center(

      ),
    );
  }
}