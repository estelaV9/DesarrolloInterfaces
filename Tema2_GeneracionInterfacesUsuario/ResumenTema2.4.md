# Tema 2.4: Permanencia de datos en Flutter
## InheritedWidget
`InheritedWidget` permite compartir datos de manera eficiente entre widgets descendientes **sin necesidad de pasarlos como argumentos**.
Se usa cuando se necesita compartir un estado/datos entre varios widgets. 

Componentes principales de un `InheritedWidget`.
- **Clase personalizada que extiende de `InheritedWidget`**: Esta clase almacena los datos que se quieren compartir.
- **Método estático para acceder a los datos** desde los widgets hijos.
- **Widget contenedor que encapsula el `InheritedWidget`**: Proporciona los datos y actualiza a los widgets dependientes cuando cambian.

### Ejemplo
1. Crear la clase personalizada que extiende de `InheritedWidget`:
```dart
// CLASE QUE HEREDA DE INHERITEDWIDGET PARA COMPARTIR DATOS ENTRE LOS WIDGETS DESCENDENTES
class ContadorProvider extends InheritedWidget {
  final int contador; // DATO QUE QUEREMOS COMPARTIR
  
  // CONSTRUCTOR DEL PROVIDER
  ContadorProvider({
    required this.contador, // VALOR DEL CONTADOR
    required Widget child, // HIJOS QUE TENDRÁ EL PROVIDER
  }) : super(child: child);
  
  // MÉTODO PARA DETERMINAR SI LOS WIDGETS DEPENDIENTES DEBEN RECONSTRUIRSE
  @override
  bool updateShouldNotify(ContadorProvider oldWidget) {
    // RECONSTRUYE SOLO SI EL VALOR DEL CONTADOR CAMBIÓ
    return oldWidget.contador != contador;
  }
  
  // MÉTODO ESTÁTICO PARA ACCEDER AL PROVIDER EN EL ÁRBOL DE WIDGETS
  static ContadorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ContadorProvider>();
  }
}
```

2. Crear la clase principal de la aplicación:
```dart
// WIDGET PRINCIPAL DE LA APLICACIÓN
class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContadorProvider(
      contador: 5, // VALOR INICIAL DEL CONTADOR
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Ejemplo InheritedWidget')),
          body: ContadorDisplay(), // MUESTRA EL CONTADOR
        ),
      ),
    );
  }
}
```

3. Widget que lee el valor del contador desde el provider:
```dart
// WIDGET QUE LEE EL VALOR DEL CONTADOR DESDE EL PROVIDER
class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // OBTIENE EL VALOR DEL CONTADOR DESDE EL PROVIDER
    final contador = ContadorProvider.of(context)?.contador ?? 0;

    return Center(
      child: Text(
        'Contador: $contador', // MUESTRA EL VALOR DEL CONTADOR
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
```


## ScopedModel
`ScopedModel` es un paquete que permite crear un modelo que puede ser accedido por cualquier parte de la aplicación. Sus componentes principales son:

- **Model**: Clase que contiene el estado y la lógica del negocio.
- **ScopedModel**: Widget que proporciona acceso al modelo a toda su subjerarquía.
- **ScopedModelDescendant**: Widget que consume los datos del modelo y reconstruye automáticamente cuando cambian.

### Ejemplo
1. Añadir la dependencia
```yaml
dependencies:
  scoped_model: ^2.0.0
```

2. Crear el Modelo
El modelo define el estado (contador) y la lógica para actualizarlo:
```dart
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// MODELO QUE CONTIENE EL ESTADO Y LA LÓGICA
class ContadorModel extends Model {
  int _contador = 0; // VALOR INICIAL DEL CONTADOR

  int get contador => _contador; // GETTER PARA ACCEDER AL CONTADOR

  // FUNCIÓN PARA INCREMENTAR EL CONTADOR
  void incrementar() {
    _contador++; // ACTUALIZA EL CONTADOR
    notifyListeners(); // NOTIFICA A LOS WIDGETS DEPENDIENTES
  }
}
```

3. Proveer el modelo con ScopedModel
```dart
void main() {
  runApp(
    ScopedModel<ContadorModel>(
      model: ContadorModel(), // PROVEE EL MODELO A LA APLICACIÓN
      child: ContadorApp(), // WIDGET PRINCIPAL
    ),
  );
}

class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ejemplo ScopedModel')),
        body: ContadorDisplay(), // WIDGET QUE MUESTRA EL CONTADOR
        floatingActionButton: IncrementarButton(), // BOTÓN PARA INCREMENTAR
      ),
    );
  }
}
```

4. Acceder al modelo usando ScopedModelDescendant:
- Widget que muestra el contador
```dart
class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return Center(
          child: Text(
            'Contador: ${model.contador}', // MUESTRA EL VALOR DEL CONTADOR
            style: TextStyle(fontSize: 24),
          ),
        );
      },
    );
  }
}
```

- Widget que incrementa el contador
```dart
class IncrementarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return FloatingActionButton(
          onPressed: model.incrementar, // LLAMA A LA FUNCIÓN PARA INCREMENTAR
          child: Icon(Icons.add), // ÍCONO DEL BOTÓN
        );
      },
    );
  }
}
```


## Provider
### Ejemplo





---
>_Estela de Vega | IES Ribera de Castilla 24/25._
