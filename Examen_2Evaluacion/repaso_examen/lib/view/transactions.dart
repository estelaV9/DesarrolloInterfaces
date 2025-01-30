import 'package:flutter/material.dart';
import 'package:repaso_examen/view/drawer_app.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TransactionsPage extends StatefulWidget {
  final Database database;

  const TransactionsPage({required this.database});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Map<String, dynamic>> conversiones = [];

  Future<void> cargarConversiones() async {
    final resultado = await widget.database.rawQuery('''
    SELECT * FROM conversiones;
    ''');
    setState(() {
      conversiones = resultado;
    });
  }

  @override
  void initState() {
    super.initState();
    cargarConversiones();
  }

  Future<void> borrarConversion(int id) async {
    await widget.database.delete('conversiones',
        where: 'id = ?', whereArgs: [id]);
    cargarConversiones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(title: Text("Transactions")),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: conversiones.length,
                    itemBuilder: (context, index) {
                      final conversion = conversiones[index];
                      return ListTile(
                        title: Row(
                          children: [
                            Text(conversion["valor"].toString()),
                            SizedBox(width: 10),
                            Text(conversion["origen"]),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward),
                            SizedBox(width: 10),
                            Text(conversion["destino"])
                          ],
                        ),
                        subtitle: Text(
                            "Destino: " + conversion["resultado"].toString()),
                        trailing: IconButton(
                            onPressed: () {
                              borrarConversion(conversion["id"]);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
