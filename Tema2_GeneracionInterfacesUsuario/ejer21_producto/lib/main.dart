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
      home: const MyHomePage(title: 'Ejercicio 21 Pagina 63'),
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
  // DEFINIR EL ESTILO PARA LOS TEXTOS DE UN TAMAÑO DE 24
  TextStyle style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: style),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(

      ),
    );
  }
}