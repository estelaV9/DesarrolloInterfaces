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
- Herramienta utilizada para gestionar estados globales e inyectar dependencias.
- Está construida sobre `InheritedWidgets`.
- Facilita el mantenimiento al separar la lógica de la interfaz.

Incluye:
1. **ChangeNotifier**: Clase para notificar cambios en el estado a los widgets.
2. **ChangeNotifierProvider**: Proveedor de estado.
3. **Consumer**: Widget para consumir datos del estado.

### Provider con ChangeNotifier
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContadorProvider(),
      child: ContadorApp(),
    ),
  );
}

class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ejemplo Provider')),
        body: ContadorDisplay(),
        floatingActionButton: IncrementarButton(),
      ),
    );
  }
}

class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contador = context.watch<ContadorProvider>().contador;
    return Center(
      child: Text('Contador: $contador', style: TextStyle(fontSize: 24)),
    );
  }
}

class IncrementarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<ContadorProvider>().incrementar();
      },
      child: Icon(Icons.add),
    );
  }
}

class ContadorProvider extends ChangeNotifier {
  int _contador = 5;
  int get contador => _contador;
  void incrementar() {
    _contador++;
    notifyListeners();
  }
}
```

## SharedPreferences
- Permite guardar datos simples como pares clave-valor de forma persistente.
- Ideal para configuraciones, preferencias o datos ligeros.

**Principales métodos:**
- `setInt`, `setString`, `setBool`: Para almacenar valores.
- `getInt`, `getString`, `getBool`: Para obtener valores guardados.
- `remove`, `clear`: Para eliminar valores existentes.

### Ejemplo
```dart
import 'package:shared_preferences/shared_preferences.dart';

void guardarDatos() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('nombreUsuario', 'Juan');
}

void obtenerDatos() async {
  final prefs = await SharedPreferences.getInstance();
  String? nombre = prefs.getString('nombreUsuario');
  print(nombre);
}
```

## SQLite en Flutter
- Base de datos ligera para almacenamiento persistente local.
- Ideal para datos estructurados.
- No requiere servidor.

### Inicialización
```dart
void main() async {
  sqfliteFfiInit();
  final databaseFactory = databaseFactoryFfi;
  final dbPath = join(await databaseFactory.getDatabasesPath(), 'my_database.db');
  final db = await databaseFactory.openDatabase(dbPath);
  print('Base de datos inicializada en: $dbPath');
}
```

### Crear tablas
```dart
await db.execute('''
  CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL
  )
''');
print('Tabla creada: users');
```

### Operaciones CRUD
- **Insertar datos:**
```dart
final userId = await db.insert('users', {
  'name': 'John Doe',
  'age': 30,
});
print('Usuario insertado con ID: $userId');
```

- **Consultar datos:**
```dart
final users = await db.query('users');
for (var user in users) {
  print('Usuario: ${user['name']}, Edad: ${user['age']}');
}
```

- **Actualizar datos:**
```dart
await db.update(
  'users',
  {'age': 35},
  where: 'name = ?',
  whereArgs: ['John Doe'],
);
print('Edad actualizada para John Doe.');
```

- **Eliminar datos:**
```dart
await db.delete(
  'users',
  where: 'age > ?',
  whereArgs: [30],
);
print('Usuarios mayores de 30 eliminados.');
```


## Actividades
### 1. Programa con un contador
Crea un  <a href="https://github.com/estelaV9/DesarrolloInterfaces/tree/master/Tema2_GeneracionInterfacesUsuario/ejer32_contador_SPS">programa</a> que incluya un contador funcional usando **ScopedModel**, **Provider** y **SharedPreferences**.

### 2. Gestión de tareas con Provider
Crea una <a href="https://github.com/estelaV9/DesarrolloInterfaces/tree/master/Tema2_GeneracionInterfacesUsuario/ejer33_gestion_tareas">aplicación</a> para gestionar tareas que incluya:
1. **Pantalla principal**: Lista de tareas (inicialmente vacía).
2. **Botón**: Agregar nuevas tareas mediante un formulario.
3. **Gestión de estado**: Uso de `ChangeNotifier` para manejar la lista de tareas.

**Detalles a implementar:**
1. Modelo `TaskProvider` que extienda `ChangeNotifier`.
2. Uso de `ChangeNotifierProvider` para gestionar el estado global.
3. Dos widgets:
   - `TaskList` (lista de tareas).
   - `AddTaskScreen` (formulario para agregar tareas).

### 3. Aplicación avanzada de tareas
Crea una <a href="https://github.com/estelaV9/DesarrolloInterfaces/tree/master/Tema2_GeneracionInterfacesUsuario/ejer34_tareas">aplicación</a> que permita:
1. Agregar tareas con título y descripción.
2. Marcar tareas como completadas o pendientes (tachar si completadas).
3. Filtrar tareas por estado.
4. Eliminar tareas.

**Detalles adicionales:**
- **Agregar tareas:**
  - Ingreso de título y descripción.
  - Estado inicial: "Pendiente".
- **Cambiar estado:**
  - Dropdown para alternar entre "Pendiente" y "Completada".
- **Filtro de estado:**
  - Selector en AppBar para "Pendiente" o "Completada".
- **Eliminar tareas:**
  - Botón para eliminar tareas específicas.

### Ejemplo SQLite 
Un <a href="https://github.com/estelaV9/DesarrolloInterfaces/tree/master/Tema2_GeneracionInterfacesUsuario/ejemplo_sqlite_task">ejemplo</a> más sencillo para entender como funciona SQLite.



---
>_Estela de Vega | IES Ribera de Castilla 24/25._
