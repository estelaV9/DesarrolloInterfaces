import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: FormPage());
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validación accesible de formulario"),
        backgroundColor: Colors.deepPurpleAccent.shade100,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Semantics(
                label: 'Campo de nombre',
                hint: 'Por favor, ingrese su nombre',
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nombre",
                      hintText: "Introduzca su nombre"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo nombre es obligatorio";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Semantics(
                label: 'Campo de correo electronico',
                hint: 'Por favor, ingrese su correo electronico',
                child: TextFormField(
                  controller: _mailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mail",
                      hintText: "Introduzca su mail"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El email no puede estar vacío';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value)) {
                      return 'Por favor ingresa un correo válido';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Semantics(
                  label: 'Botón de enviar',
                  hint: 'Para enviar el formulario, pulse este botón',
                  child: ElevatedButton(
                      onPressed: () {
                        _key.currentState?.validate(); // VALIDAR
                      },
                      child: const Text("Enviar")))
            ],
          ),
        ),
      ),
    );
  }
}
