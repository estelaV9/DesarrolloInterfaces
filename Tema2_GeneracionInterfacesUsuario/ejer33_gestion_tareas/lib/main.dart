import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_task.dart';

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
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 33',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListTasks(title: 'Ejercicio 33 Pagina 93'),
    );
  }
}

// NO CAMBIA EL ESTADO, SE RECONSTRUYE -> SE USA StatelessWidget
class ListTasks extends StatelessWidget {
  const ListTasks({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Lista de Tareas", style: TextStyle(fontSize: 24)),

            // MOSTRAR LA LISTA DE TODAS LAS TAREAS
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  return ListView.builder(
                    itemCount: taskProvider.listNames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(taskProvider.listNames[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskProvider extends ChangeNotifier {
  final List<String> _listNames = []; // LSITA TAREAS

  List<String> get listNames => _listNames; // GET TAREAS

  void addTask(String newTask) {
    _listNames.add(newTask); // AGREGAR LA NUEVA TAREA A LA LISTA
    notifyListeners(); // NOTIFICAR A LOS LISTENERS QUE LA LISTA CAMBIO
  }
}
