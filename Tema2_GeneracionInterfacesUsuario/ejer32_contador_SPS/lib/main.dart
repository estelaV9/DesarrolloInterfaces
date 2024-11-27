import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/* EJER 32: Crea un programa con un contador siguiendo los ejemplos, que sea
capaz de mostrar un contador e incrementarlo con un botón flotante
Impleméntalos usando ScopedModel, Provider y SharedPreferences. ¿Qué
diferencia hay al volver a abrir la aplicación? */

void main() {
  runApp(ContadorDisplay());
}

class ContadorDisplay extends StatelessWidget {
  ContadorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return Center(
          child: Text('Contador: ${model.contador}',
              style: TextStyle(fontSize: 24)),
        );
      },
    );
    /*return MaterialApp(
      title: 'EJERCICIO 32',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 32. Contador'),
    );*/
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
      body: Center(),
    );
  }
}
