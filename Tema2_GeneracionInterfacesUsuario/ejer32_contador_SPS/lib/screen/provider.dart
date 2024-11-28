import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* PROVIDER SCREEN */

/* DENTRO DE ProviderScreen, TODOS LOS WIDGETS HIJOS (COMO ContadorDisplay
E IncrementarButton) PUEDEN ACCEDER AL MODELO ContadorProvider USANDO EL CONTEXTO. */

// ESTA CLASE DEFINE LA ESTRUCTURA BÁSICA DE LA APLICACIÓN
class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ProviderEjemplo'), centerTitle: true,),
        body: const ContadorDisplay(), // DEFINE EL CONTADOR
        floatingActionButton: const IncrementarButton(), // DEFINE EL BOTÓN
      ),
    );
  }
}

/* MUESTRA EL VALOR ACTUAL DEL CONTADOR
 * ESCUCHA LOS CAMBIOS EN EL MODELO ContadorProvider CON context.watch<ContadorProvider>()
 * OBTIENE EL VALOR ACTUAL DE contador Y LO SETEA */
class ContadorDisplay extends StatelessWidget {
  const ContadorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final contador = context.watch<ContadorProvider>().contador;
    return Center(
      child: Text('Contador: $contador', style: const TextStyle(fontSize: 24)),
    );
  }
}

class IncrementarButton extends StatelessWidget {
  const IncrementarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // ACCEDE AL METODO incrementar DEL MODELO
        context.read<ContadorProvider>().incrementar();
      },
      child: const Icon(Icons.add),
    );
  }
}

/* CLASE QUE EXTIENDE DE CHANGENOTIFIER PARA PODER NOTIFICAR A LOS WIDGETS
 * DE CUALQUIER CAMBIO EN LA VARIABLE _contador */
class ContadorProvider extends ChangeNotifier {
  int _contador = 5;

  int get contador => _contador;

  void incrementar() {
    _contador++;
    notifyListeners();
  }
}