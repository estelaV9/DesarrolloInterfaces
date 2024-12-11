import 'dart:ui';

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
  final dbPath = join(await dbFactory.getDatabasesPath(), 'taskManagement.db');
  final db = await dbFactory.openDatabase(dbPath);

  // CREAMOS LA TABLA 'tasksTable' SI NO EXISTE
  await db.execute('''
  CREATE TABLE IF NOT EXISTS tasksTable (
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

  @override
  void initState() {
    super.initState();
    _loadTask(); // CARGAR LAS TAREAS AL INICIAR
  }

  Future<void> _loadTask() async {
    String whereClause = '';
    List<String> whereArgs = [];

    // FILTRO POR ESTADO
    if (filtro == 'Pendiente') {
      whereClause = 'isCompleted = ?';
      whereArgs.add('0');
    } else if (filtro == 'Completada') {
      whereClause = 'isCompleted = ?';
      whereArgs.add('1');
    }

    final tasksQuery = await widget.database.query('tasksTable',
        where: whereClause.isNotEmpty ? whereClause : null,
        whereArgs: whereArgs.isNotEmpty ? whereArgs : null);
    setState(() {
      _tasks = tasksQuery;
    });
  } // MÉTODO PARA CARGAR LAS TAREAS DESDE LA BASE DE DATOS

  Future<void> _addTask(String title, String description) async {
    await widget.database.insert('tasksTable', {
      'title': title,
      'description': description,
      'isCompleted': 0 // NUEVAS TAREAS SON PENDIENTES POR DEFECTO
    });
    _loadTask(); // RECARGAR LAS TAREAS
  } // MÉTODO PARA AÑADIR UNA NUEVA TAREA

  Future<void> _deleteTask(int id) async {
    await widget.database
        .delete('tasksTable', where: 'id = ?', whereArgs: [id]);
    _loadTask(); // RECARGAR LAS TAREAS
  } // MÉTODO PARA ELIMINAR UNA TAREA

  Future<void> _updateTaskStatus(int id, int newStatus) async {
    await widget.database.update(
      'tasksTable',
      {'isCompleted': newStatus},
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadTask(); // RECARGAR LAS TAREAS
  } // MÉTODO PARA ACTUALIZAR EL ESTADO DE UNA TAREA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          // FILTRO DE TAREAS
          DropdownButton(
            items: const [
              DropdownMenuItem(
                value: "Todas",
                child: Text("TODAS"),
              ),
              DropdownMenuItem(
                value: "Pendiente",
                child: Text("PENDIENTE"),
              ),
              DropdownMenuItem(
                value: "Completada",
                child: Text("COMPLETADA"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                filtro = value!; // ACTUALIZAR EL FILTRO
                _loadTask(); // CARGAR LAS TAREAS SEGÚN EL FILTRO
              });
            },
            value: filtro,
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // FORMULARIO PARA AGREGAR NUEVAS TAREAS
              Form(
                key: _keyForm,
                child: Row(
                  children: [
                    // CAMPO DE TEXTO PARA EL TÍTULO
                    Expanded(
                      child: TextFormField(
                        controller: _titleController,
                        decoration:
                            const InputDecoration(label: Text("TÍTULO")),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "EL TÍTULO NO PUEDE ESTAR VACÍO";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    // CAMPO DE TEXTO PARA LA DESCRIPCIÓN
                    Expanded(
                      child: TextFormField(
                        controller: _descriptionController,
                        decoration:
                            const InputDecoration(label: Text("DESCRIPCIÓN")),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "LA DESCRIPCIÓN NO PUEDE ESTAR VACÍA";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    // BOTÓN PARA AÑADIR UNA NUEVA TAREA
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          _addTask(_titleController.text,
                              _descriptionController.text);
                          _titleController.clear(); // LIMPIAR EL TÍTULO
                          _descriptionController.clear(); // LIMPIAR DESCRIPCIÓN
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // LISTA DE TAREAS
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length, // NÚMERO DE TAREAS
                  itemBuilder: (context, index) {
                    final task = _tasks[index]; // OBTENER CADA TAREA
                    return ListTile(
                      title: Text(
                        task['title'],
                        style: TextStyle(
                          decoration: task['isCompleted'] == 1
                              ? TextDecoration.lineThrough
                              : TextDecoration
                                  .none, // TACHAR SI ESTÁ COMPLETADA
                        ),
                      ),
                      subtitle: Text(task['description']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // DROPDOWN PARA CAMBIAR EL ESTADO
                          DropdownButton<int>(
                            items: const [
                              DropdownMenuItem(
                                  value: 0, child: Text("PENDIENTE")),
                              DropdownMenuItem(
                                  value: 1, child: Text("COMPLETADA")),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                _updateTaskStatus(task['id'], value);
                              }
                            },
                            value: task['isCompleted'],
                          ),
                          // BOTÓN PARA ELIMINAR LA TAREA
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteTask(task['id']);
                            },
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
