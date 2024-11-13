import 'package:flutter/material.dart';

/*Implementa un StatefulWidget que incremente el contador
al presionar el botón. ¿Se podría hacer con un StatelessWidget?*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ejercicio 3",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(title: "Ejercicio 3"),
    );
  }
}

class CounterPage extends StatefulWidget {
  final String title;

  const CounterPage({super.key, required this.title});

  @override
  State<CounterPage> createState() => _CounterState();
}

// CREAMOS UNA CLASE QUE EXTIENDE DEL ESTADO DE LA CLASE "CounterPage"
class _CounterState extends State<CounterPage> {
  final TextStyle textStyle = const TextStyle(fontSize: 24);
  int counter = 0; // ATRIBUTO CONTADOR INICIALIZADO EN 0

  void onCounterAction() {
    setState(() {
      counter++; // INCREMENTAMOS EL CONTADOR
    }); // SETEAMOS EL ESTADO
  } // METODO PARA INCREMENTAR EL CONTADOR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: textStyle,
        ),
      ),
      body: Center(
        child: Column(
          // PONERLO EN EL CENTRO
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              counter.toString(), // TEXTO CON VALOR DEL CONTADOR
              style: textStyle,
            ),

            // AÑADIR UN ESPACIO ENTRE EL TEXTO Y EL BOTON DE 10
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
                onPressed: () {
                  // SE LLAMA A LA FUNCION INCREMENTAR CUANDO SE PULSA EL BOTON
                  onCounterAction();
                },
                child: Text(
                  "Pulsar",
                  style: textStyle,
                ))
          ],
        ),
      ),
    );
  }
}
