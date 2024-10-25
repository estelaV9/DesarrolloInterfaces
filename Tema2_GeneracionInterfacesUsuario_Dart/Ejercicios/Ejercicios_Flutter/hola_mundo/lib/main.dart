import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false, // PARA QUITAR LA MARCA DE DEBUG
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primera App en Flutter'),
        ),
        body: Center(
            child: Text('¡Hola Mundo!',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 40),
        ),
      ),
    ),);
  }
}