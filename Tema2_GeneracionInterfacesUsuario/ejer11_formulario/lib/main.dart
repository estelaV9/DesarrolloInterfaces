import 'package:flutter/material.dart';

/* EJERCICIO 11: Crea un formulario de registro que tenga TextFields para nombre, correo
electrónico y contraseña. Usa el widget Form para gestionar la validación, y
añade un botón para enviar el formulario */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 11',
      debugShowCheckedModeBanner: false, // QUITAR LA MARCA DE DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FormPage(title: 'Ejercicio 11: Formulario de Registro'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.title});

  final String title;

  @override
  State<FormPage> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<FormPage> {
  // CLAVE GLOBAL PARA EL FORM
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(
            child: Text(
              'Formulario de Registro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey, // ASIGNAR LA CLAVE GLOBAL AL FORM
          child: Column(
            children: <Widget>[
              // CAMPO NOMBRE
              const TextFieldGenerator(
                nombreCampo: 'Nombre',
                numValidacion: 1,
              ),

              // CAMPO CORREO ELECTRONICO
              const TextFieldGenerator(
                nombreCampo: 'Correo electrónico',
                numValidacion: 2, // Validación para correo electrónico
              ),

              // CAMPO DE CONTRASEÑA
              const TextFieldGenerator(
                nombreCampo: 'Contraseña',
                numValidacion: 3, // Validación para contraseña
              ),

              // BOTON ENVIAR
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // SI ES VALIDO, MOSTRAMOS UN MENSAKE
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulario Enviado')),
                    );
                  } else {
                    // SI LA VALIDACION FALLA, MOSTRAMOS UN MENSAJE
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Por favor, complete el formulario correctamente')),
                    );
                  }
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldGenerator extends StatelessWidget {
  final String nombreCampo;
  final int numValidacion;

  const TextFieldGenerator({
    super.key,
    required this.nombreCampo,
    required this.numValidacion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: nombreCampo),
          style: const TextStyle(fontSize: 24),
          validator: (value) {
            switch (numValidacion) {
              case 1: // VALIDACIÓN PARA QUE EL CAMPO NO ESTÉ VACÍO (NOMBRE)
                if (value == null || value.isEmpty) {
                  return 'Este campo no puede estar vacío';
                }
                break;
              case 2: // VALIDACIÓN PARA EL CORREO ELECTRÓNICO
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un correo electrónico';
                }
                // Expresión regular para verificar formato de correo electrónico
                if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                    .hasMatch(value)) {
                  return 'Por favor ingresa un correo válido';
                }
                break;
              case 3: // VALIDACIÓN PARA LA CONTRASEÑA
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una contraseña';
                }
                // Validación de contraseña: al menos 6 caracteres
                if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                break;
              default:
                return null; // Si no hay un tipo de validación definido
            }
            return null; // Si todo es válido
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}