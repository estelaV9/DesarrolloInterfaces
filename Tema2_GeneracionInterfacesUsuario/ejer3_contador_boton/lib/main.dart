import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // QUITAR MARCA DEBUG
      title: 'Flutter Demo',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() =>
      _MyStatefulWidgetState();
}


// CREAMOS UNA CLASE QUE EXTIENDE DEL ESTADO DE LA CLASE "MyStatefulWidget"
class _MyStatefulWidgetState extends State<MyStatefulWidget>{
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
        title: Text("Ejercicio 3 Página 31"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // CENTRA LA COLUMNA
          children: [
            Text(contador.toString(), style: TextStyle(fontSize: 24)), // TEXTO CON EL VALOR DEL CONTADOR

            // AÑADIR UN MARGEN ENTRE EL TEXTO Y EL BOTON DE 20
            const Padding(padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),),

            ElevatedButton(
                onPressed: (){
                  // SE LLAMA A LA FUNCION INCREMENTAR CUANDO SE PULSA EL BOTON
                  incrementarContador();
                }, child: (Text("Incrementar", style: TextStyle(fontSize: 24)))
            )
          ],
        ),
      ),
    );
  }
}