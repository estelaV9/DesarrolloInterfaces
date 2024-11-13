import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // QUITA LA MARCA DEL DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LifeCycleDemo(title: 'Mensaje Bienvenida',),
    );
  }
}

class LifeCycleDemo extends StatefulWidget {
  final String title;
  const LifeCycleDemo({super.key, required this.title});

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  @override
  void initState() {
    super.initState();
    print("Bienvenido! - initState()");
  } // METODO initState

  @override
  Widget build(BuildContext context) {
    print("Construyendo la interfaz - build()");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ciclo de Vida del Widget"),
      ),
      body: const Center(
        child: Text(
          "¡Hola! Mira la consola para ver el ciclo de vida del widget.",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("Adiós! - dispose()");
    super.dispose();
  }
}
