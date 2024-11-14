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
  final TextStyle style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Pantalla A', style: style), // TITULO DE LA BARRA SUPERIOR
        centerTitle: true, // CENTRAR EL APPBAR
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

// ESTA ES LA SEGUNDA PANTALLA ("PantallaB")
class PantallaB extends StatelessWidget {
  const PantallaB({super.key});
  final TextStyle style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Pantalla B', style: style), // TITULO DE LA BARRA SUPERIOR
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // AQUÍ SE USA `Navigator.pop` PARA VOLVER A LA PANTALLA ANTERIOR
            Navigator.pop(context); // CIERRA LA PANTALLA ACTUAL (VUELVE A "PantallaA")
          },
          child: const Text('Volver a Pantalla A'), // TEXTO DEL BOTÓN
        ),
      ),
    );
  }
}