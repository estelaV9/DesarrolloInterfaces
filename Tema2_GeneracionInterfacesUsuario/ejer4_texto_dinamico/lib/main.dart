import 'package:flutter/material.dart';
/* EJERCICIO 4: Crea una interfaz que muestre un texto dinámico
que cambie al presionar un botón (dentro de build(), muestra un texto y
un botón que actualice el texto cada vez que se pulse)*/
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
  TextoDinamicoBoton createState() => TextoDinamicoBoton();
} // CLASE PRINCIPAL


class TextoDinamicoBoton extends State<PaginaPrincipal> {
  List<String> textoACambiar =
  ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"]; // LISTA CON LOS TEXTOS A CAMBIAR
  int contador = 0; // VARIABLE CONTADOR

  void cambiarTexto(){
    setState(() {
      // MIENTRAS EL CONTADOR NO LLEGUE AL FINAL DE LA LISTA INCREMENTARA,
      // SI NO, SE SETTEARA EN 0 PARA QUE SE VUELVA A RECORRER
      if(contador == textoACambiar.length - 1){
        contador = 0; // SE SETTEA A 0
      } else {
        contador++; // SE INCREMENTA
      }
    });
  } // METODO PARA CAMBIAR TEXTO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 4 Pagina 32", style: TextStyle(fontSize: 24),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // CENTRA LA COLUMNA
          children: [
            Text(textoACambiar[contador], style: const TextStyle(fontSize: 24),), // TEXTO A CAMBIAR

            // AÑADIR UN MARGEN ENTRE EL TEXTO Y EL BOTON DE 20
            const Padding(padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            )),

            ElevatedButton(
                onPressed: (){
                  cambiarTexto(); // SE LLAMA A LA FUNCION, QUE AUMENTARA EL CONTADOR
                }, child: (const Text("Cambiar", style: TextStyle(fontSize: 24))))
          ],
        ),
      ),
    );
  }
}