import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 20 Pagina 63',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PantallaA(title: 'Ejercicio 20 Pagina 63'),
    );
  }
}

class PantallaA extends StatelessWidget {
  const PantallaA({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla A'), // TITULO DE LA BARRA SUPERIOR
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // AQUÍ SE USA `Navigator.push` PARA IR A "PantallaB"
            Navigator.push(
              context, // CONTEXTO ACTUAL
              MaterialPageRoute(
                builder: (context) => const PantallaB(), // DEFINE QUE VAS A "PantallaB"
              ),
            );
          },
          child: const Text('Ir a Pantalla B'), // TEXTO DEL BOTÓN
        ),
      ),
    );
  }
}
