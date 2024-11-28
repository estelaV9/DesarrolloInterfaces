import 'package:ejer32_contador_sps/screen/provider.dart';
import 'package:ejer32_contador_sps/screen/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

/* EJER 32: Crea un programa con un contador siguiendo los ejemplos, que sea
capaz de mostrar un contador e incrementarlo con un botón flotante
Impleméntalos usando ScopedModel, Provider y SharedPreferences. ¿Qué
diferencia hay al volver a abrir la aplicación? */

void main() {
  runApp(
    const ContadorApp(),
  );
}

// APLICACIÓN PRINCIPAL
class ContadorApp extends StatelessWidget {
  const ContadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 32',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 32 - Pagina 92'),
    );
  }
}

// PÁGINA PRINCIPAL CON NAVEGACIÓN ENTRE PANTALLAS
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    // PANTALLA USANDO ScopedModel
    ScopedModel<ContadorModel>(
      model: ContadorModel(),
      child: const ScopedModelScreen(),
    ),
    // PANTALLA USANDO Provider
    ChangeNotifierProvider(
      create: (_) => ContadorProvider(),
      child: const ProviderScreen(),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: "ScopedModel"),
          BottomNavigationBarItem(icon: Icon(Icons.sync), label: "Provider"),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}