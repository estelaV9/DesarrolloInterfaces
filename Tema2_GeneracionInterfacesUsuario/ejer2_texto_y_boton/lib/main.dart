import 'package:flutter/material.dart';

/*Crea una aplicación que siga una jerarquía simple de widgets utilizando un
Column que tenga varios Text y un Button (ElevatedButton)
 • Haz que, al pulsar el botón, muestre un mensaje en la consola.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejercicio 2",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TextButtonPage(title: 'Ejercicio 2'),
    );
  }
}

class TextButtonPage extends StatefulWidget {
  final String title;

  const TextButtonPage({super.key, required this.title});

  @override
  State<TextButtonPage> createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButtonPage> {
  // DEFINIMOS EL ESTILO DEL TEXTO PARA REUTILIZAR
  final TextStyle textStyle = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: const TextStyle(fontSize: 24)),
      ),
      body: Center(
        child: Column(
          // LO CENTRAMOS
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Texto 1",
              style: textStyle, // PARA APLICAR EL ESTILO TIENE QUE SER UN WIDGET SIN CONST
            ),
            const SizedBox(height: 10), // AÑADIR ESPACIO
            Text(
              "Texto 2",
              style: textStyle,
            ),
            const SizedBox(height: 10),
            Text(
              "Texto 3",
              style: textStyle,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  print("Mensaje por consola"); // CUANDO SE PULSA SE MUESTRA UN MENSAJE POR CONSOLA
                },
                child: Text(
                  "Pulsar Boton",
                  style: textStyle,
                ))
          ],
        ),
      ),
    );
  }
}
