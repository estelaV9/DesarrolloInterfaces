import 'package:flutter/material.dart';
/*EJERCICIO 12: Crea una galería de imágenes en una cuadrícula usando GridView.
Aplica padding a cada imagen y un borde redondeado usando BoxDecoration.*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 12',
      debugShowCheckedModeBanner: false, // QUITAR MARCA DEBBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GalleryPage(title: 'Ejercicio 12 Pagina 52'),
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Ejercicio 12 Página 52",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          padding: EdgeInsets.all(30),
          // AÑADIR UN PADDING A LAS FOTOS

          children: const <Widget>[
            PlantillaImagen("gato1.jpg"),
            PlantillaImagen("frontalPhotoShrek.jpeg"),
            PlantillaImagen("homer.jpg"),
            PlantillaImagen("Michis.jpg"),
            PlantillaImagen("shrekPhoto.jpg"),
            PlantillaImagen("gato1.jpg"),
            PlantillaImagen("frontalPhotoShrek.jpeg"),
            PlantillaImagen("homer.jpg"),
            PlantillaImagen("Michis.jpg"),
            PlantillaImagen("shrekPhoto.jpg"),
          ],
        ),
      ),
    );
  }
}

class PlantillaImagen extends StatelessWidget {
  final String imageName;

  const PlantillaImagen(this.imageName, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // PERMITE AGREGAR UN BORDE REDONDEADO A LA IMAGEN
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/$imageName',
        // SE PONE BoxFit PARA QUE SE AJUSTE AL ESPACIO DISPONIBLE
        fit: BoxFit.cover, // NO SE PONE EL TAMAÑO PORQUE EL GRIDVIEW YA LO GESTIONA
      ),
    );
  }
}