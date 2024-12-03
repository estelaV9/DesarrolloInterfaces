import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

import 'model/Tasks.dart';

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
  final dbPath = join(await dbFactory.getDatabasesPath(), 'taskManagement.db');
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
        home: TaskManagementScreen(
            title: 'Gestor de Tareas', database: database));
  }
}

class TaskManagementScreen extends StatefulWidget {
  const TaskManagementScreen(
      {super.key, required this.title, required this.database});

  final String title;
  final Database database; // ATRIBUTO PARA PASAR LA DB

  @override
  State<TaskManagementScreen> createState() => _TaskManagementScreenState();
}

class _TaskManagementScreenState extends State<TaskManagementScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  var filtro = "Todas";
  List<Map<String, dynamic>> _tasks = []; // LISTA PARA ALMACENAR LAS TAREAS
  final _taskController =
  TextEditingController(); // CONTROLADOR PARA EL CAMPO DE TEXTO

  @override
  void initState() {
    super.initState();
    _loadTasks(); // CARGAR LAS TAREAS AL INICIAR
  }

  // FUNCION PARA CARGAR LAS TAREAS DESDE LA BASE DE DATOS
  Future<void> _loadTasks() async {
    final tasks = await widget.database.query('tasks'); // CONSULTA LAS TAREAS
    setState(() {
      _tasks = tasks; // ACTUALIZA EL ESTADO CON LAS TAREAS OBTENIDAS
    });
  }

  // FUNCION PARA AÑADIR UNA NUEVA TAREA A LA BASE DE DATOS
  Future<void> _addTask(String title, String description) async {
    await widget.database.insert('tasks', {
      'title': title,
      'description': description,
      'isCompleted': 0
    }); // INSERTA LA TAREA
    _titleController.clear(); // LIMPIA EL CAMPO DE TEXTO
    _descriptionController.clear();
    _loadTasks(); // VUELVE A CARGAR LAS TAREAS ACTUALIZADAS
  }

  // FUNCION PARA TOGGLEAR EL ESTADO DE UNA TAREA (COMPLETADA O NO)
  Future<void> _toggleTask(int id, int isCompleted) async {
    await widget.database.update(
      'tasks',
      {'isCompleted': isCompleted == 0 ? 1 : 0}, // CAMBIA EL ESTADO DE COMPLETADO
      where: 'id = ?', // FILTRA POR EL ID DE LA TAREA
      whereArgs: [id],
    );
    _loadTasks(); // VUELVE A CARGAR LAS TAREAS ACTUALIZADAS
  }

  // FUNCION PARA ELIMINAR UNA TAREA DE LA BASE DE DATOS
  Future<void> _deleteTask(int id) async {
    await widget.database.delete('tasks',
        where: 'id = ?', whereArgs: [id]); // ELIMINA LA TAREA POR ID
    _loadTasks(); // VUELVE A CARGAR LAS TAREAS ACTUALIZADAS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          DropdownButton(
            items: const [
              DropdownMenuItem(
                value: "Todas",
                child: Text("Todas"),
              ),
              DropdownMenuItem(
                value: "Pendiente",
                child: Text("Pendiente"),
              ),
              DropdownMenuItem(
                value: "Completada",
                child: Text("Completada"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                filtro = value!;
              });
            },
            value: filtro,
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(label: Text("Título")),
                    ),
                  ),
                  const SizedBox(width: 10), // Espaciado entre los campos
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(label: Text("Descripción")),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add), // ÍCONO PARA AÑADIR UNA NUEVA TAREA
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        _addTask(_titleController.text, _descriptionController.text);
                      }
                    }, // LLAMAR A LA FUNCIÓN PARA AÑADIR TAREA
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length, // CANTIDAD DE TAREAS EN LA LISTA
                  itemBuilder: (context, index) {
                    final task = _tasks[index]; // OBTENER CADA TAREA
                    return ListTile(
                      title: Text(
                        task['title'], // MUESTRA EL TÍTULO DE LA TAREA
                        style: TextStyle(
                          decoration: task['isCompleted'] == 1
                              ? TextDecoration
                              .lineThrough // SI LA TAREA ESTA COMPLETADA, SE MUESTRA EN SUBRAYADO
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(task['isCompleted'] == 1
                                ? Icons.check_box // ÍCONO DE TAREA COMPLETADA
                                : Icons.check_box_outline_blank),
                            // ÍCONO DE TAREA NO COMPLETADA
                            onPressed: () => _toggleTask(task['id'],
                                task['isCompleted']), // TOGGLE DEL ESTADO DE LA TAREA
                          ),
                          IconButton(
                            icon: Icon(Icons.delete), // ÍCONO DE ELIMINAR TAREA
                            onPressed: () => _deleteTask(task['id']), // LLAMAR A LA FUNCION DE ELIMINAR TAREA
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
