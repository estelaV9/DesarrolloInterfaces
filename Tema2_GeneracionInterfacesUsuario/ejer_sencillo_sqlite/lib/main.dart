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
      home:
          PersonScreen(title: 'Ejercicio sencillo SQLite', database: database),
    );
  }
}

// PANTALLA PERSON
class PersonScreen extends StatefulWidget {
  final Database database;

  const PersonScreen({super.key, required this.title, required this.database});

  final String title;

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  List<Map<String, dynamic>> _persons = []; // LISTA PARA METER A LAS PERSONAS

  @override
  void initState() {
    _addPerson("Jose", 20);
    _addPerson("Pepe", 25);
    super.initState();
    _loadPerson(); // LLAMAR AL METODO PARA CARGAR LAS PERSONAS
  } // AL INICIAR LA APLICACION

  Future<void> _loadPerson() async {
    final personsQuery = await widget.database.query('person');
    setState(() {
      _persons = personsQuery;
    });
  } // FUNCION PARA ACTULIZAR EL ESTADO DE LAS PERSONAS

  Future<void> _addPerson(String name, int age) async {
    // INSERTAR EN LA TABLA persons EL NOMBRE Y LA EDAD DE LA PERSONA
    await widget.database.insert('person', {'nombre': name, 'edad': age});
    //_loadPerson();
  } // METODO PARA AÑADIR PERSONAS

  Future<void> _deleteJose(String name) async {
    await widget.database.delete('person',
        where: 'nombre = ?', whereArgs: [name]); // ELIMINA POR NOMBRE
  } // METODO PARA ELIMINAR A JOSE DE LA LISTA

  Future<void> _modifyJose(String name, int edad) async {
    await widget.database.update('person', {'edad': edad},
        where: 'nombre = ?', whereArgs: [name]);
  } // METODO PARA ACTUALIZAR LA EDAD DE JOSE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _persons.length,
                  itemBuilder: (context, index) {
                    final person = _persons[index];
                    return ListTile(
                      title:
                          Text(person['nombre'] + " Edad: " + person['edad']),
                    );
                  })),
          ElevatedButton(
              onPressed: () {
                _loadPerson();
              },
              child: Text("READ")),
          ElevatedButton(
              onPressed: () {
                _modifyJose("Jose", 33);
              },
              child: Text("MODIFY")),
          ElevatedButton(
              onPressed: () {
                _deleteJose("Jose");
              },
              child: Text("DELETE")),
        ],
      )),
    );
  }
}
