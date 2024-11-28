import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/* SCOPEDMODEL SCREEN */

// ESTRUCTURA BÁSICA DE LA APLICACIÓN
class ScopedModelScreen extends StatelessWidget {
  const ScopedModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ScopedModel Ejemplo'), centerTitle: true,),
        body: const ContadorDisplay(),
        // EN LA CLASE ContadorDisplay DEFINIMOS VISUALMENTE EL CONTADOR
        floatingActionButton:
        // EN LA CLASE IncrementarButton DEFINIMOS VISUALMENTE EL BOTÓN FLOTANTE
        const IncrementarButton(),
      ),
    );
  }
}

// WIDGET QUE MUESTRA EL VALOR ACTUAL DEL CONTADOR. AL UTILIZAR ScopedModelDescendant<ContadorModel>
// PODEMOS ACCEDER A LA CLASE ContadorModel (SIMILAR A ALGO ESTÁTICO)
class ContadorDisplay extends StatelessWidget {
  const ContadorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return Center(
          child: Text('Contador: ${model.contador}',
              style: const TextStyle(fontSize: 24)),
        );
      },
    );
  }
}

// BOTÓN FLOTANTE. UTILIZA ScopedModelDescendant<ContadorModel> PARA TENER ACCESO
// AL MODELO ContadorModel()
class IncrementarButton extends StatelessWidget {
  const IncrementarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return FloatingActionButton(
          onPressed: model.incrementar,
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

// CLASE QUE MANEJA LA LÓGICA DE LA APLICACIÓN, CON ATRIBUTO, UN GET Y
// UN MÉTODO PARA INCREMENTAR
class ContadorModel extends Model {
  int _contador = 5;

  int get contador => _contador;

  void incrementar() {
    _contador++;
    notifyListeners(); // NOTIFICA A LOS LISTENERS DE QUE HA CAMBIADO EL ESTADO
    // DE LA VARIABLE QUE ESTAN "ESCUCHANDO"
  }
}