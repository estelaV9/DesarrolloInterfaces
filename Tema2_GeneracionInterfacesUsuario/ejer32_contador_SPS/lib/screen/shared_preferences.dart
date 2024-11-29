import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* PANTALLA DE EJEMPLO PARA GUARDAR Y OBTENER DATOS USANDO SHARED PREFERENCES */
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // CORRECTAMENTE INCIALIZADO
  final prefs = await SharedPreferences.getInstance();
  final contadorInicial = prefs.getInt('contador') ?? 5;

  runApp(SharedPreferencesScreen(contadorInicial: contadorInicial));
}

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key, required this.contadorInicial});

  final int contadorInicial;

  @override
  State<SharedPreferencesScreen> createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  late int _contador; //Inicialización tardía

  @override
  void initState() {
    super.initState();
    _contador = widget.contadorInicial;
  }

  Future<void> _incrementarContador() async {
    setState(() {
      _contador++;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('contador', _contador);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SharedPreferences Ejemplo')),
        body: Center(
            child:
                Text('Contador: $_contador', style: const TextStyle(fontSize: 24))),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementarContador,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}