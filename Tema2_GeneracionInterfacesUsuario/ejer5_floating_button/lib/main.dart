import 'package:flutter/material.dart';
/*Ejercicio 5: Crea una aplicación básica con un Scaffold que contenga una AppBar,
un cuerpo de texto y un FloatingActionButton.
Se incrementara un contador*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // QUITAR MARCA DEBUG
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  MyFloatingActionButton createState() => MyFloatingActionButton();
}

class MyFloatingActionButton extends State<PaginaPrincipal> {
  int contador = 0; // ATRIBUTO CONTADOR INICIALIZADO EN 0
  void incrementarContador(){
    setState(() {
      contador++; // INCREMENTAMOS EL CONTADOR
    }); // SETEAMOS EL ESTADO
  } // METODO PARA INCREMENTAR EL CONTADOR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 5 Página 32"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // CENTRAR LA COLUMNA
          children: [
            Text(contador.toString(), style: TextStyle(fontSize: 24)), // TEXTO CON EL VALOR DEL CONTADOR

            // AÑADIR UN MARGEN ENTRE EL TEXTO Y EL BOTON DE 20
            const Padding(padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            )),
          ],
        ),
      ),

      // BOTON FLOATING ACTION (+)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementarContador(); // LLAMAR AL METODO INCREMENTAR CONTADOR
        },
        child: Icon(Icons.add), // ICONO DEL SIMBOLO '+'
      ),
    );
  }
}