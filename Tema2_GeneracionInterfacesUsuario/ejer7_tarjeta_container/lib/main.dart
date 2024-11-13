import 'package:flutter/material.dart';

/* EJERCICIO 7: Diseña una tarjeta dentro de un Container con un color blanco de
fondo, bordes y relleno personalizado.
Utiliza las propiedades de margin, padding y borderRadius de Container
para realizarlo */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CardPage(title: 'Ejercicio 3'),
    );
  }
}

class CardPage extends StatefulWidget {
  final String title;

  const CardPage({super.key, required this.title});

  @override
  State<CardPage> createState() => _CardState();
}

class _CardState extends State<CardPage> {
  final TextStyle style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: style,
        ),
        centerTitle: true, // CENTRA EL TEXTO DEL APPBAR
      ),
      body: Center(
        child: Container(
          width: 200.0,
          // ANCHO DEL CONTENEDOR
          height: 200.0,
          // ALTURA DEL CONTENEDOR
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black38, width: 2),
            borderRadius: BorderRadius.circular(20),
            // RADIO PARA BORDES REDONDEADOS
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5), // SOMBRA HACIA ABAJO
              ),
            ],
          ),
          padding: const EdgeInsets.all(30),
          // PADDING PARA EL INTERIOR DEL CONTENEDOR
          margin: const EdgeInsets.all(50),
          // ESPACIO EXTERIOR ALREDEDOR DE LA TARJETA
          child: Center(
            // CENTRAR EL TEXTO EN EL CONTAINER
            child: Text(
              "nfjksdakfds",
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
