import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyList(),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final List<String> items = List.generate(50, (index) => 'Elemento $index');

  // KEY PARA GUARDAR EL ESTADO DE LA POSICION DEL DESPLAZAMIENTO
  final PageStorageKey _key = const PageStorageKey('myListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Persistente'),
      ),
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: ListView.builder(
          key: _key, // ASOCIA EL KEY A LA LISTA PARA GUARDAR EL ESTADO
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}