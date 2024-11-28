import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class AddTaskScreen extends StatelessWidget {
  final _nameController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Agregar Tarea"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text("Nueva Tarea"),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    // AGREGAR LA TAREA SI EL CAMPO NO ESTA VACIO
                    context.read<TaskProvider>().addTask(_nameController.text);
                    Navigator.pop(context); // VOLVER A LA PANTALLA ANTERIOR
                  }
                },
                child: const Text("Agregar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}