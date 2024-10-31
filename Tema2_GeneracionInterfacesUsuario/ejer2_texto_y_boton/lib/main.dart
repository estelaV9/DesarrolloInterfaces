import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ejercicio 2 Página 31"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // CENTRA LA COLUMNA
            children: [
              Text("Texto 1", style: TextStyle(fontSize: 24)),
              Text("Texto 2", style: TextStyle(fontSize: 24)),

              // AÑADIR UN MARGEN ENTRE LOS TEXTOS Y EL BOTON DE 20
              const Padding(padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),),

              ElevatedButton(
                  onPressed: () {
                    print("Has pulsado el boton"); // CUANDO SE PRESIONA EL BOTON SE MUESTRA UN MENSAJE POR CONSOLA
                  },
                  child: (Text("PULSAR", style: TextStyle(fontSize: 24)) // TEXTO DEL BOTON
                  )
              )
            ],
          ),
        )
    );
  }
}