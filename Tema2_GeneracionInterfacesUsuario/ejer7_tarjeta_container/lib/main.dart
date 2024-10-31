import 'package:flutter/material.dart';

/*EJERCICIO 7:  Diseña una tarjeta dentro de un Container con un color
blanco de fondo, bordes y relleno personalizado. Utiliza las propiedades
de margin, padding y borderRadius de Container para realizarlo*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 7',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PaginaPrincipal(title: 'Ejercicio 7 Pagina 32'),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PaginaPrincipal> createState() => _TarjetaContainer();
}

class _TarjetaContainer extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(16.0), // ESPACIO EXTERIOR ALREDEDOR DE LA TARJETA
            color: Colors.white,
            child: Container(
              width: 200.0, // ANCHO DEL CONTENEDOR
              height: 200.0, // ALTURA DEL CONTENEDOR
              alignment: Alignment.center,
               padding: const EdgeInsets.all(25.0), // PADDING PARA EL INTERIOR DEL CONTENEDOR
              decoration: BoxDecoration(
                color: Colors.white, // COLOR DE FONDO DEL CONTENEDOR INTERIOR
                border: Border.all(
                  color: Colors.purple, // COLOR DEL BORDE
                  width: 2.0, // ANCHO DEL BORDE
                ),
                borderRadius: BorderRadius.circular(10), // RADIO PARA BORDES REDONDEADOS
              ),
              child: const Text("Texto dentro de un contenedor", style: TextStyle(fontSize: 24),)
            ),
          ),
        ));
  }
}
