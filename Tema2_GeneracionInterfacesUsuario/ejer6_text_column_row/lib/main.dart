import 'package:flutter/material.dart';

/*EJERCICIO 6:  Crea una pantalla que utilice Text, Column y Row
para organizar el contenido.
 • El Column debe alinear dos textos verticalmente, y el Row alinear dos botones
horizontalmente*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PaginaPrincipal(title: 'Ejercicio 6 Pagina 32'),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PaginaPrincipal> createState() => _PantallaConColumna();
}

class _PantallaConColumna extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Column(
              children: <Widget>[
                Text("Column", style: TextStyle(fontSize: 24),),
                Text("Texto1", style: TextStyle(fontSize: 24),),
                Text("Texto2", style: TextStyle(fontSize: 24),),
              ],
            ),

            // AÑADIR UN MARGEN ENTRE COLUMNA Y FILA
            const Padding(padding: EdgeInsets.only(
              top: 40, bottom: 40,
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ElevatedButton( // BOTON 1
                onPressed: (){
                  print("has pulsado el boton 1");
                }, child: (const Text("Button1", style: TextStyle(fontSize: 24),))),

                // AÑADIR UN MARGEN ENTRE LOS BOTONES
                const Padding(padding: EdgeInsets.only(
                  left: 20, right: 20,
                )),

                ElevatedButton( // BOTON 2
                    onPressed: (){
                      print("has pulsado el boton 2");
                    }, child: (const Text("Button2", style: TextStyle(fontSize: 24),)))
              ],
            )
          ]),
        ));
  }
}