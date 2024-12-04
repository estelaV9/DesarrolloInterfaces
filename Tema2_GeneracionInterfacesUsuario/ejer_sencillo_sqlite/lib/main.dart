import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

/* CREAR UNA BASE DE DATOS (id, nombre, edad) Y MOSTRAR UNA LISTA CON LOS NOMBRES
* TENDRA TRES BOTONES QUE SEAN READ (carga a la lista), UPDATE (jose -> 30) Y
* DELETE DONDE ELIMINARA A JOSE*/


void main() async {
  // INICIALIZAR EL sqflite PARA ESCRITORIO
  sqfliteFfiInit();
  final databaseFactory = databaseFactoryFfi;

  // OBTENER LA RUTA DE LA BASE DE DATOS
  final dbPath = join(await databaseFactory.getDatabasesPath(), 'persons.db');
  final database = await databaseFactory.openDatabase(dbPath);

  // CREA LA TABLA 'person' SI NO EXISTE
  await database.execute('''
 CREATE TABLE IF NOT EXISTS person (
   id INTEGER PRIMARY KEY AUTOINCREMENT,  
   nombre TEXT NOT NULL,                   
   edad TEXT NOT NULL 
 )
 ''');

  // INICIA LA APLICACIÓN Y PASA LA BASE DE DATOS A LA INTERFAZ PRINCIPAL
  runApp(PersonApp(database: database));
}

class PersonApp extends StatelessWidget {
  final Database database;

  const PersonApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio sencillo SQLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio sencillo SQLite'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

      ),
    );
  }
}
