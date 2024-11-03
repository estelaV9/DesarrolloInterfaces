import 'package:flutter/material.dart';

/*EJERCICIO 9: Crea una interfaz de perfil donde uses Stack para
superponer una imagen de fondo con un avatar redondeado y un botón
de edición sobre la imagen.
Usa los widgets Stack, Positioned, Image, CircleAvatar y Button*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 9',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 9 Página 51'),
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
        child: Stack(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: 400,
                height: 400,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // CENTRADO
                    children: [
                      Image.network(
                          'https://images.unsplash.com/photo-1663970206579-c157cba7edda?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9uZG8lMjBkZSUyMHBhbnRhbGxhJTIwcGFyYSUyMHBjfGVufDB8fDB8fHww'),
                    ])),
            Positioned(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // CONTENEDOR CIRCULAR
                  border: Border.all(
                    color: Colors.black, // COLOR BORDE
                    width: 2, // GROSOR DEL BORDE
                  )
                ),
                child: CircleAvatar(
                  radius: 100, // Ajusta el radio para que coincida con el tamaño deseado
                  backgroundColor: Colors.black, // El color de fondo del círculo
                  backgroundImage: NetworkImage('https://i.pinimg.com/236x/70/85/54/7085548f3d0372a08aea0291ddcee895.jpg'), // Imagen de fondo
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
