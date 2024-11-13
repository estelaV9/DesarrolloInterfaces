import 'package:flutter/material.dart';
/*EJERCICIO 15: Diseña una pantalla de perfil de usuario usando Stack para mostrar
una imagen de portada (fondo), un avatar redondeado superpuesto a la izquierda,
y el nombre del usuario a la derecha.
1. Añade un formulario debajo que permita editar los textos, guardarlos y que
cambien.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 15 Pagina 52',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaginaPantalla(title: 'Ejercicio 15 Pagina 52'),
    );
  }
}

class PaginaPantalla extends StatefulWidget {
  const PaginaPantalla({super.key, required this.title});

  final String title;

  @override
  State<PaginaPantalla> createState() => _StatePaginaPantalla();
}

class _StatePaginaPantalla extends State<PaginaPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Ejercicio 15 Pagina 52",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: Container(
            width: 600,
            height: 700,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                border: Border.all(color: Colors.black38, width: 5),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  const Text(
                    "Perfil de Usuario",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                              child: Container(
                            width: 400.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((20)),
                                // AÑADIMOS AL CONTENEDOR LA IMAGEN DE FONDO ---> AssetImage
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/catWallpaper.jpg"),
                                    fit: BoxFit.fill),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                          )),
                          Positioned(
                              // EL POSITIONED TIENE VALORES PARA PONER MARGIN
                              top: 37,
                              left: 30,
                              child: Row(children: [
                                CircleAvatar(
                                    radius: 60,
                                    backgroundImage:
                                        AssetImage("assets/imagenPerfil.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular((100)),
                                          // AÑADIMOS AL CONTENEDOR LA IMAGEN DE FONDO ---> AssetImage
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/imagenPerfil.png"),
                                              fit: BoxFit.fill),
                                          border: Border.all(
                                              color: Colors.lightBlueAccent,
                                              width: 2)),
                                    )),
                                const Padding(padding: EdgeInsets.all(14)),
                                const Text(
                                  "nfjdsanf",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                )
                              ]))
                        ],
                      )
                    ],
                  )
                ]))),
      ),
    );
  }
}
