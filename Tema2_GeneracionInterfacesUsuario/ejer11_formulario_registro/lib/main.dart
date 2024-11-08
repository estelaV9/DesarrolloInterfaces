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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FormPage(title: 'Ejercicio 11: Formulario de Registro'),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}