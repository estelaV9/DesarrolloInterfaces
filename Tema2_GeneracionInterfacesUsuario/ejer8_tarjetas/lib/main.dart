import 'package:flutter/material.dart';

/* EJERCICIO 8: Crea una pantalla con varias tarjetas (Card) que
tengan un título y una imagen.
Aplica “padding” y “margin” a cada tarjeta, y usa “Box Decoration” para añadir
bordes redondeados y una sombra */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 8 Pagina 51'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          child: Container(
        width: 600.0, // ANCHO DEL CONTENEDOR DONDE IRA EL GRIDVIEW
        height: 600.0, // ALTURA DEL CONTENEDOR DONDE IRA EL GRIDVIEW
        child: GridView.count(
          crossAxisCount: 2, // DOS COLUMNAS EN EL GRID
          crossAxisSpacing: 10.0, // MARGEN HORIZONTAL ENTRE TARJETAS
          mainAxisSpacing: 10.0, // MARGEN VERTICAL ENTRE TARJETAS
          children: const [
            // SE LLAMA A LA CLASE TarjetaPersonalizada QUE DEVOLVERA UNA TARJETA
            TarjetaPersonalizada(
                titulo: "TEXTO 1",
                urlImagen:
                    "https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid"),
            TarjetaPersonalizada(
                titulo: "TEXTO 2",
                urlImagen:
                    "https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid"),
            TarjetaPersonalizada(
                titulo: "TEXTO 3",
                urlImagen:
                    "https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid"),
            TarjetaPersonalizada(
                titulo: "TEXTO 4",
                urlImagen:
                    "https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid"),
          ],
        ),
      )),
    );
  }
}

class TarjetaPersonalizada extends StatelessWidget {
  final String titulo; // TITULO DE LA TARJETA
  final String urlImagen; // URL DE LA IMAGEN

  const TarjetaPersonalizada(
      {super.key, required this.titulo, required this.urlImagen});

  @override
  Widget build(BuildContext context) {
    return Card(
        // DEVUELVE UN CARD
        child: Container(
            // CONTENEDOR DE LO QUE TENDRA LA TARJETA
            decoration: BoxDecoration(
                // DECORACION DEL CONTEINER
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(blurRadius: (10), color: Colors.black)
                ]),

            child: Center(
                child: Column(children: [
              Text(titulo, style: const TextStyle(fontSize: 24)),
              const Padding(padding: EdgeInsets.all(10)),
              Image.network(
                urlImagen,
                width: 200,
                height: 200,
              ),
            ]))));
  }
}
