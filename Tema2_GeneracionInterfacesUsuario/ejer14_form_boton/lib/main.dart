import 'package:flutter/material.dart';

/*EJERCICIO 14: Crea un formulario que tenga campos de texto para nombre, correo
electrónico y contraseña. Añade un botón de envío que valide que todos los
campos están completos y que el correo electrónico es correcto*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 13 Pagina 52',
      debugShowCheckedModeBanner: false,
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