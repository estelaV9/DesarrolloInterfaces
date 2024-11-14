import 'package:flutter/material.dart';

/*EJERCICIO 21: Crea una pantalla DetallesProducto que reciba un objeto Producto desde la pantalla
principal. Al pulsar en un producto en la pantalla principal, se debe navegar a
DetallesProducto y mostrar los detalles del objeto.
 1. El diseño de la pantalla principal debe ser el mínimo para cumplir la
especificación.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 21 Pagina 63',
      debugShowCheckedModeBanner: false, // QUITAR LA MARCA DEL DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(title: 'Ejercicio 21 Pagina 63'),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  // DEFINIR EL ESTILO PARA LOS TEXTOS DE UN TAMAÑO DE 24
  final TextStyle style = const TextStyle(fontSize: 24);
  const PantallaPrincipal({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ejercicio 21 Pagina 63", style: style),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10), // ESPACIO INTERIOR DENTRO DEL CONTAINER
          margin: const EdgeInsets.symmetric(horizontal: 400, vertical: 50), // ESPACIO EXTERIOR ALREDEDOR DEL CONTAINER
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.shade100, // COLOR DE FONDO DEL CONTENEDOR
            borderRadius: BorderRadius.circular(15), // BORDES REDONDEADOS
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // COLOR DE LA SOMBRA
                spreadRadius: 5, // RANGO DE EXPANSIÓN DE LA SOMBRA
                blurRadius: 10, // INTENSIDAD DEL DESENFOQUE DE LA SOMBRA
                offset: const Offset(0, 5), // DESPLAZAMIENTO DE LA SOMBRA (X, Y)
              ),
            ],
            border: Border.all(
              color: Colors.deepPurple, // COLOR DEL BORDE
              width: 2, // ANCHO DEL BORDE
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
      );
  }
}