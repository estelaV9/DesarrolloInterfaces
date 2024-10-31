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

  // This widget is the root of your application.
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            // CONTENEDOR PARA METER EL GRIDVIEW
            child: Container(
                width: 600.0, // ANCHO DEL GRIDVIEW
                height: 600.0, // ALTURA DEL GRIDVIEW
                child: GridView.count(
                    crossAxisCount: 2,
                    // COLUMNAS
                    crossAxisSpacing: 10.0,
                    // MARGEN HORIZONTAL ENTRE LAS COLUMNAS
                    mainAxisSpacing: 10.0,
                    // MARGEN VERTICAL ENTRE LAS COLUMNAS
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.purple,width: 4),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: (10),
                              color: Colors.purple
                            )
                          ]
                        ),
                          child: Center(
                              child: Column(children: [
                            const Text("TEXTO 1",
                                style: TextStyle(fontSize: 24)),

                            const Padding(padding: EdgeInsets.all(10)),

                            Image.network(
                              "https://img.freepik.com/foto-gratis/gato-futurista-gafas-proteccion_23-2150969319.jpg?semt=ais_hybrid",
                              width: 200,
                              height: 200,
                            )
                          ]))),
                      Container(color: Colors.blue, child: Text('2')),
                      Container(color: Colors.green, child: Text('3')),
                    ]))));
  }
}
