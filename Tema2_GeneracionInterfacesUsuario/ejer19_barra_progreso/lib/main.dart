import 'dart:ffi';

import 'package:flutter/material.dart';

/*EJERCICIO 19: Crea una barra de progreso que se rellene al presionar un botón, simulando
una descarga. Usa LinearProgressIndicator y actualizado en función del
porcentaje que aumenta cada vez que se presione el botón.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  late double valueLine = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: 400,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.grey),
          child: Column(
            children: [
              SizedBox(height: 20,),
              LinearProgressIndicator(
                value: valueLine / 100,

              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                setState(() {
                  valueLine += 10;
                });
              }, style: ButtonStyle(),
                  child: Text("Aumentar", style: TextStyle(fontSize: 24),))
            ],
          ),
        ),
      ),
    );
  }
}
