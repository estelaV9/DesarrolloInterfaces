import 'package:flutter/material.dart';

/* EJERCICIO 11: Crea un formulario de registro que tenga TextFields para nombre, correo
electrónico y contraseña. Usa el widget Form para gestionar la validación, y
añade un botón para enviar el formulario */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Center(
            child: Text(
              'Formulario de Registro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            children: <Widget>[
              // CAMPO NOMBRE
              const TextFieldGenerator(nombreCampo: 'Nombre',),

              // CAMPO CORREO ELECTRONICO
              const TextFieldGenerator(nombreCampo: 'Correo electrónico',),

              // CAMPO DE CONTRASEÑA
              const TextFieldGenerator(nombreCampo: 'Contraseña',),

              // BOTON ENVIAR
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Formulario Enviado')),
                  );
                },
                child: Text(
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

  const TextFieldGenerator(
      {super.key, required this.nombreCampo}); // ATRIBUTO PARA CUARDAR LOS NOMBRES DE LOS CAMPOS

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: nombreCampo),
          style: const TextStyle(fontSize: 24),),
        const SizedBox(height: 10),
      ],
    );
  }
}