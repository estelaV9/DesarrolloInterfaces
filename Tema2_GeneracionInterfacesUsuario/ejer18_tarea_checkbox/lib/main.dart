import 'package:flutter/material.dart';

/*EJERCICIO 18: Implementa una lista de tareas en la que el usuario pueda marcar las tareas
como completadas utilizando Checkbox. En caso de que la marque, el texto
debe cambiar a color gris claro y tacharse.
 1. Como extra, que el usuario pueda añadir tareas con algún tipo de Form.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late var isPulsado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          width: 400,
          decoration: BoxDecoration(color: Colors.grey),
          child: ListView(
            children: [
              ListTile(
                  leading: Checkbox(
                      value: isPulsado,
                      onChanged: (value) {
                        setState(() {
                          if (isPulsado) {
                            value = isPulsado;
                          } else {
                            value = isPulsado;
                          }
                          isPulsado = !isPulsado;
                        });
                      }),
                  title: text(isPulsado, "Prueba 1")),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Añadir",
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Text text(bool isPulsado, String nombre) {
  if (isPulsado) {
    return Text(
      nombre,
      style: TextStyle(color: Colors.black),
    );
  } else {
    return Text(nombre,
        style: const TextStyle(
            color: Colors.black26, decoration: TextDecoration.lineThrough));
  }
} // FUNCION PARA DEVOLVER EL TEXTO CON ESTILO SEGUN SI HA PULSADO EL CHECKBOX O NO
