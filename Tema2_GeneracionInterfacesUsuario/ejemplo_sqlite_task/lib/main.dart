import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async {
  // INICIALIZAR EL sqflite PARA ESCRITORIO
  sqfliteFfiInit();
  final databaseFactory = databaseFactoryFfi;

  // OBTENER LA RUTA DE LA BASE DE DATOS
  final dbPath = join(await databaseFactory.getDatabasesPath(), 'tasks.db');
  final database = await databaseFactory.openDatabase(dbPath);

  // CREA LA TABLA 'tasks' SI NO EXISTE
  await database.execute('''
 CREATE TABLE IF NOT EXISTS tasks (
   id INTEGER PRIMARY KEY AUTOINCREMENT,  // ID DE LA TAREA
   title TEXT NOT NULL,                   // TITULO DE LA TAREA
   completed INTEGER NOT NULL DEFAULT 0   // INDICA SI LA TAREA ESTA COMPLETADA 
 )
 ''');

  // INICIA LA APLICACIÓN Y PASA LA BASE DE DATOS A LA INTERFAZ PRINCIPAL
  runApp(TaskApp(database: database));
}

class TaskApp extends StatelessWidget {
  final Database database;

  // CONSTRUCTOR PARA PASAR LA BASE DE DATOS A LA APLICACIÓN
  TaskApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(database: database), // MUESTRA LA PANTALLA DE TAREAS
    );
  }
}

class TaskScreen extends StatefulWidget {
  final Database database;

  // CONSTRUCTOR PARA PASAR LA BASE DE DATOS A LA PANTALLA DE TAREAS
  TaskScreen({required this.database});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
  Future<void> _addTask(String title) async {
    await widget.database
        .insert('tasks', {'title': title, 'completed': 0}); // INSERTA LA TAREA
    _taskController.clear(); // LIMPIA EL CAMPO DE TEXTO
    _loadTasks(); // VUELVE A CARGAR LAS TAREAS ACTUALIZADAS
  }

  // FUNCION PARA TOGGLEAR EL ESTADO DE UNA TAREA (COMPLETADA O NO)
  Future<void> _toggleTask(int id, int completed) async {
    await widget.database.update(
      'tasks',
      {'completed': completed == 0 ? 1 : 0}, // CAMBIA EL ESTADO DE COMPLETADO
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
      appBar: AppBar(title: Text('Tareas')), // TÍTULO DE LA PANTALLA
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController, // ENLACE CON EL CONTROLADOR
                    decoration: InputDecoration(
                        hintText: 'Nueva tarea'), // TEXTO DE INDICACIÓN
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add), // ÍCONO PARA AÑADIR UNA NUEVA TAREA
                  onPressed: () => _addTask(_taskController
                      .text), // LLAMAR A LA FUNCIÓN PARA AÑADIR TAREA
                ),
              ],
            ),
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
                      decoration: task['completed'] == 1
                          ? TextDecoration
                              .lineThrough // SI LA TAREA ESTA COMPLETADA, SE MUESTRA EN SUBRAYADO
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(task['completed'] == 1
                            ? Icons.check_box // ÍCONO DE TAREA COMPLETADA
                            : Icons.check_box_outline_blank),
                        // ÍCONO DE TAREA NO COMPLETADA
                        onPressed: () => _toggleTask(task['id'],
                            task['completed']), // TOGGLE DEL ESTADO DE LA TAREA
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
    );
  }
}
