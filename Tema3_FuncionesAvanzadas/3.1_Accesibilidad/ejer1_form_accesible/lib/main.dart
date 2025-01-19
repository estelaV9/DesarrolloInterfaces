import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // CLAVE GLOBAL PARA EL FORM
  final _formKey = GlobalKey<FormState>();

  // AÑADIR LOS CONTROLADORES PARA LOS TEXTFIELDS
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ejercicio 1: Formulario accesible"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Form(
                key: _formKey,
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
                          hintText: "Ingrese su nombre",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese su nombre';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Semantics(
                      label: 'Campo correo electrónico',
                      hint: 'Por favor, ingrese su correo',
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Correo electrónico",
                          hintText: "Ingrese su correo",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese su correo';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // BOTON PARA ENVIAR EL FORMULARIO
                    Semantics(
                      label: 'Botón de enviar',
                      hint: 'Para enviar el formulario, pulse este botón',
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState?.validate();
                        }, // VALIDAR
                        child: const Text(
                          'Enviar',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
