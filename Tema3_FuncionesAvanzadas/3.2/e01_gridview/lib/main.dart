import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: InterfaceGridViewPage());
  }
}

class InterfaceGridViewPage extends StatefulWidget {
  const InterfaceGridViewPage({super.key});

  @override
  State<InterfaceGridViewPage> createState() => _InterfaceGridViewPageState();
}

class _InterfaceGridViewPageState extends State<InterfaceGridViewPage> {
  @override
  Widget build(BuildContext context) {
    // USA MediaQuery PARA OBTENER EL ANCHO DE LA VENTANA
    final screenWidth = MediaQuery.sizeOf(context).width;

    // DEFINE LA CANTIDAD DE COLUMNAS BASADA EN EL ANCHO DE LA VENTANA
    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 1; // UNA COLUMNA PARA MENOS DE 600PX
    } else if (screenWidth < 1200) {
      crossAxisCount = 2; // DOS COLUMNAS ENTRE 600PX Y 1200PX
    } else {
      crossAxisCount = 4; // CUATRO COLUMNAS PARA MAS DE 1200PX
    }

    // DEVUELVE EL Scaffold QUE CONTIENE EL GridView
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI ADAPTATIVA CON GRIDVIEW'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: GridView.builder(
        // CONFIGURA EL GridView PARA AJUSTARSE DINAMICAMENTE
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // SE DEFINE LAS COLUMNAS
          mainAxisSpacing: 10, // ESPACIO ENTRE LAS FILAS
          crossAxisSpacing: 10, // ESPACIO ENTRE LAS COLUMNAS
        ),
        itemCount: 20, // NUMERO DE ELEMENTOS EN LA CUADRICULA
        itemBuilder: (context, index) {
          // CONSTRUYE LOS ELEMENTOS DE LA CUADRICULA
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.teal, // COLOR DE FONDO
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Elemento $index',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}