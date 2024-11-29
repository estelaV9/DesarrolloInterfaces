import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

/* EJERCICIO 34: Crea una aplicación que permita al usuario:
    • Agregar tareas con un título y descripción.
    • Marcar tareas como completadas o pendientes.
      • Si está completada, tachar el texto.
    • Filtrar tareas por estado (pendientes/completadas).
    • Eliminar tareas.

    Funcionalidades:
    1. Agregar Tareas:
      • El usuario puede ingresar un título y descripción para una nueva tarea.
      • El estado inicial de las tareas es “Pendiente”.
    2. Marcar Tareas como Completadas o Pendientes:
      • Cada tarea tiene un DropdownButton que permite cambiar su estado entre “Pendiente” y “Completada”.
    3. Filtrar Tareas por Estado:
      • El filtro en el AppBar permite seleccionar entre “Pendiente” y “Completada
    4. Eliminar Tareas:
      • Cada tarea incluye un botón que elimina la tarea de la base de datos. */

void main() async {
  sqfliteFfiInit(); // INICIALIZAMOS EL sqflite PARA ESCRITORIO
  final dbFactory = databaseFactoryFfi;

  // OBTENER LA RUTA DE LA BD
  final dbPath =
      join(await dbFactory.getDatabasesPath(), 'taskManagement.db');
  final db = await dbFactory.openDatabase(dbPath);

  // CREAMOS LA TABLA 'tasks' SI NO EXISTE
  await db.execute('''
  CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    isCompleted INTEGER NOT NULL DEFAULT 0 
  )
  ''');

  // INICIAR LA APLICACION
  runApp(TaskManagementApp(database: db));
}

class TaskManagementApp extends StatelessWidget {
  final Database database; // AÑADIR EL ATRIBUTO PARA LA BASE DE DATOS
  const TaskManagementApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 34: Gestion Tareas'),
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
      body: Center(),
    );
  }
}
