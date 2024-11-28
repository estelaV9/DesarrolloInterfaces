import 'package:flutter/material.dart';

/* EJERCICIO 33: Crea una aplicación para gestionar tareas usando Provider,
que cumpla las siguientes características:

 1. Una pantalla principal que muestre la lista de tareas (inicialmente vacía)
 2. Un botón para agregar nuevas tareas desde un formulario (en otra ventana)
 3. El estado de las tareas se gestiona con ChangeNotifier.

• Ten en cuenta:
 1. Implementa un modelo TaskProvider que extienda de ChangeNotifier y gestione
    la lista de tareas.
 2. Usa ChangeNotifierProvider para proporcionar el estado de la aplicación.
 3. Crea dos widgets: la lista de tareas (TaskList) y el formulario para agregar
    tareas (AddTaskScreen) */


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 33',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 33 Pagina 93'),
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
        title: Text(widget.title),
      ),
      body: Center(

      ),
    );
  }
}
