import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  // AÑADIR LOS CONTROLADORES PARA LOS TEXTFIELDS
  final _nameController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Form(
                key: _formKey, // ASIGNAMOS LA CLAVE DEL FORMULARIO
                child: Row(children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Nombre",
                                hintText: "Nombre",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El nombre no puede estar vacío';
                                }
                                return null; // Retorna null si la validación pasa
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _apellidoController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Apellidos",
                                hintText: "Apellidos",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Los apellidos no pueden estar vaciíos';
                                }
                                return null; // Retorna null si la validación pasa
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email",
                                hintText: "Email",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El email no puede estar vacío';
                                } else if (!RegExp(
                                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Por favor ingresa un correo válido';
                                }
                                return null; // Retorna null si la validación pasa
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Contraseña",
                                hintText: "Contraseña",
                              ),
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'La contraseña debe tener al menos 6 caracteres';
                                }
                                return null; // Retorna null si la validación pasa
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Confirmar Contraseña",
                                hintText: "Confirmar Contraseña",
                              ),
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return 'Las contraseñas no coinciden';
                                }
                                return null; // Retorna null si la validación pasa
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _formKey.currentState?.validate(); // VALIDAR
                                },
                                child: const Text(
                                  "Registrarse",
                                  style: TextStyle(fontSize: 15),
                                ))
                          ])))
                ]))));
  }
}
