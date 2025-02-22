# Tema 2: Generación de Interfaces de Usuario con Flutter
## Ciclo de vida
Flutter tiene dos tipos de widgets: `StatelessWidget` y `StatefulWidget`. Estos dos tipos tiene diferentes ciclos de vida:
- `StatelessWidget`: son widgets sin estado, es decir, una vez que se crean, **no cambian**. Su ciclo de vida se resumen en: se construyen una vez y permanecen estáticos.
- `StatefulWidget`: son widgets con estado, es decir, pueden **cambiar** durante la ejecución. Su ciclo de vida es más complejo, ya que Flutter debe reconstruir la interfaz de usuario cada vez que el estado cambia.
  
### Ejemplo
1. Lo primero que deberemos hacer (aunque ya viene al crear el proyecto) es importar el paquete de `material.dart` que provee los componentes básicos para construir interfaces en Flutter:
```dart
import 'package:flutter/material.dart';
```
2. **Función `main()`**: es el punto de entrada de la aplicación. `runApp()` toma el widget raíz de la aplicación (`Myapp` en este caso) y lo adjunta a la pantalla del dispositivo.
```dart
void main() {
  runApp(const MyApp());
}
```

3. **Widget `Myapp`**: esta clase extiende `StatelessWidget`, lo que significa que su estructura no cambiará una vez creada.
Dentro del `build()`, el widget `MyHomePage` es el principal contenedor que configura temas y rutas para la aplicación. 
`home: const MyHomePage(...)` define el widget `MyHomePage` como la pantalla principal. Aquí se pasa un `título` a MyHomePage, que en este caso es "Flutter Demo Home Page".
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // QUITA LA MARCA DEL DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

4. **Widget `MyHomePage` (StatefulWidget):** `MyHomePage` extiende `StatefulWidget`, lo que indica que su interfaz de usuario puede cambiar en respuesta a interacciones.
`createState()` devuelve una instancia de `_MyHomePageState`, la clase que controlará el estado de `MyHomePage`.

```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
```

5. **Clase `_MyHomePageState`:** Esta es la clase que maneja el estado de `MyHomePage`. Aquí es donde se implementará los métodos de ciclo de vida y los cambios en el estado.

## Cambiar de estado
Se puede implementar una clase State para manejar el estado del widget y utilizar el método `setState()` para actualizar el estado.
### Ejemplo
```dart
class MyStatefulWidget extends StatefulWidget {
 @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    }); // METODO setState()
  }
  @override
  Widget build(BuildContext context) {
  return Column( children: [
   Text('Presiona el botón: $_counter veces'),
   ElevatedButton(
      onPressed: _incrementCounter,
      child: Text('Incrementar'),
  ),],);}
}
```

## Scaffold
El `Scaffold` proporciona una estructura básica para una pantalla de Flutter, incluyendo:
- `AppBar`: Barra superior con titulo y acciones.
- `Drawer`: Menú lateral.
- `BottomNavigationBar`: Menú inferior.
- `FloatingActionButton`: Botón flotante.

## Navigator
En Flutter, se puede utilizar el sistema de navegación basado en rutas para gestionar la transición entre pantallas.
Las pantallas se manejan como rutas que se añaden y elminan de la pila de navegación:
- `Navigator.push()`: Añade una nueva pantalla (ruta) a la pila.
- `Navigator.pop()`: Quita la pantalla actual de la pila y vuelve a la anterior.
Con datos:
```dart
Navigator.pop(context, 'Resultado'); // DEVUELVE 'RESULTADO' AL CERRAR LA PANTALLA ACTUAL
```
Con retorno de datos:
```dart
final resultado = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SegundaPantalla()),
);
print('Resultado: $resultado'); // CAPTURA EL VALOR RETORNADO DE LA SEGUNDAPANTALLA
```

### Navegación con rutas
Las rutas se deefinen en `MaterialApp`, dentro de la propiedad `routes`,  y cada pantalla se puede identificar por su nombre. Esto es útil cuando quieres manejar rutas complejas o reusar rutas en distintos puntos de la aplicación.
`Navigator.pushNamed()`: Navega utilizando una ruta con su nombre.
```dart
MaterialApp(
  routes: {
    '/': (context) => PrimeraPantalla(),  // RUTA INICIAL
    '/segunda': (context) => SegundaPantalla(),
  },
)
// Navegación con rutas nombradas
Navigator.pushNamed(context, '/segunda'); // NAVEGA A LA PANTALLA IDENTIFICADA COMO '/SEGUNDA'
```

### Paso de datos entre pantallas
Se pueden pasar objetos o tipos de datos simples a través de los parámetros del constructor:
1. Primera Pantalla
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetallesPantalla(datos: 'Datos Ejemplo')),
); // PASA 'DATOS EJEMPLO' A LA SEGUNDA PANTALLA
```
2. Segunda Pantalla
```dart
class DetallesPantalla extends StatelessWidget {
  final String datos;
  DetallesPantalla({required this.datos}); // RECIBE LOS DATOS EN EL CONSTRUCTOR

  @override
  Widget build(BuildContext context) {
    return Text(datos); // MUESTRA LOS DATOS RECIBIDOS EN LA PANTALLA
  }
}
```



---

# Tema 2: Generación de Interfaces de Usuario. Dart
## Introducción
`Dart` se utiliza principalmente con Flutter para construir aplicaciones móviles nativas 
para Android e iOS desde una **única base de código**. <br>
También se aplica en el desarrollo web y del lado del servidor, y puede ser compilado 
para ejecutarse en la **web** o directamente en **máquinas**.
<br><br>

`Flutter` es un **framework de interfaz de usuario** que permite crear aplicaciones multiplataforma 
desde una **sola base de código**, utilizando `Dart` como lenguaje principal. <br>
Dart está diseñado para tiempos de respuesta rápidos, ideales para interfaces modernas 
que requieren **fluidez**. <br>
Gracias a la `compilación Ahead Of Time` (AOT), las aplicaciones desarrolladas con 
Dart y Flutter tienen un rendimiento casi nativo, lo que asegura transiciones y animaciones suaves.

### Características Principales
La `compilación AOT` produce ejecutables rápidos, mientras que la compilación `Just-In-Time` (JIT) 
optimiza el desarrollo con tiempos de carga más cortos y depuración más eficaz. <br>
Soporta tanto programación `tipada estática` como `dinámica` y permite `POO` y `funciones asíncronas`.

### Instalación del Entorno:
Para comenzar a usar Dart, es necesario instalar el Dart SDK, que contiene las herramientas para escribir 
y ejecutar programas Dart.
- **Windows**: Descargar el <a href="https://dart.dev/get-dart">ejecutable</a>.
- **macOS**: Usar el gestor de paquetes Homebrew: brew install dart.
- **Linux**: Instalar a través de apt-get o descargar manualmente el SDK desde la página oficial de Dart.

## Dart
### Primer programa
El programa comienza con la funcion `main()`, la función `print()` se utiliza para mostrar texto en la consola.
```dart
void main() {
  print('Hello, World!');
}
```

### Variables
Se pueden declara variables de diversas maneras:
- `var`: cuando se quiera determinar el tipo de varibale en el momento de la asignación.
  ```dart
  var numero = 10; // DART DETERMINA QUE ES UN ENTERO
  ```
- `final`: cuando se quiera asignar un valor que no se cambiará después de ser inicializado.
  ```dart
   final pi = 3.14; // NO SE PUEDE CAMBIAR EL VALOR DE PI DESPUES DE ESTA ASIGNACION
  ```
- `const`: se utiliza para definir valores constantes que no cambian durante la compilación.

### Tipos de Datos
- `int`: para números enteros.
- `double`: para números decimales.
- `String`: para cadenas de texto.
- `bool`: para booleanos.
- `List`: para listas ordenadas.
- `Set`: para conjuntos sin duplicados.
- `Map`: para pares clave-valor.
- `tipo dynamic`: para variables cuyo tipo puede cambiar durante la ejecución.

#### Tipos de Datos Dinámicos
El tipo `dynamic` permite que una variable cambie de tipo durante el tiempo de ejecución. 
Aunque puede amentar el riesgo de errores en tiempo de ejecución. Por ejemplo:
```dart
  dynamic ejemplo = 'Hola';
  ejemplo = 42; // AHORA ES DE TIPO int
```

### Operadores
- `Aritméticos`: +, -, / y % para realizar cálculos matemáticos.
- `Relacionales`: ==, !=, >, <, >= y <= para la lógica de control de flujo.
- `Lógicos`: &&, || y ! para la combinacion de condiciones.

### Control de Flujo
#### Condicionales
```dart
   if (edad >= 18) {
    print('Es mayor de edad');
   } else {
    print('Es menor de edad');
   }
```
O con el **operador ternario**:
```dart
  var mensaje = (edad >= 18) ? 'Mayor de edad' : 'Menor de edad';
```

### Estructuras de bucle
#### For
```dart
  for (int i = 0; i < 5; i++) {
    print('Iteración $i');
   }
```
#### While
```dart
 int contador = 0;
 while (contador < 5) {
  print('Contador: $contador');
  contador++;
 }
```

### Funciones
Permiten realizar una tarea específica y poderla reutilizar cuando queramos.
```dart
void mostrarSaludo({String nombre = 'Invitado'}) { 
  print('Hola, $nombre');
}
```

### Funciones lambda
Permiten escribir funciones de una forma más compacta y concisa. Estas funciones mejoran la legibilidad del código
```dart
int sumar(int a, int b) => a + b;
```

### POO
```dart
class Persona { 
  String nombre; 
  int edad;

  void mostrarInfo() { 
    print('Nombre: $nombre, 
    Edad: $edad'); 
  } 
} 
```
```dart
void main() { 
  Persona persona = Persona(); 
  persona.nombre = 'Ana'; 
  persona.edad = 25; 
  persona.mostrarInfo(); 
}
```

#### Constructores
- `Por defecto`: se definen para inicializar variables. 
- `Nombrados`: ofrecen una forma detallada de inicializar objetos.
```dart
 class Persona {
  String nombre;
  int edad;
  Persona(this.nombre, this.edad);
  Persona.sinEdad(this.nombre) {
    edad = 0; // CONSTRUCTOR NOMBRADO
  }
}
```

#### Herencia 
Se puede crear una clase base y extenderla para crear nuevas clases con características adicionales.
```dart
class Animal {
  void hacerSonido() {
    print('rawr');
  }
}
```

```dart
 class Perro extends Animal {
  void hacerSonido() {
    print('Ladrar');
  }
}
```

#### Mixins y Polimorfismo
El `polimorfismo` es la capacidad de una función o método para comportarse de diferentes maneras.
En Dart, esto se logra mediante la **sobreescritura de métodos** en clases que heredan de otras.
<br><br>
Los `mixins` permiten reutilizar códifo sin necesidad de utilizar herencia múltiple. Es una clase que contiene
métodos que otras clases pueden usar.

```dart
mixin Volador {
  void volar() => print('Estoy volando!');
}

class Pajaro with Volador {}

void main() {
  Pajaro pajaro = Pajaro();
  pajaro.volar(); // Salida: Estoy volando!
}
```

#### Interfaces
En dart, cualquier clase puede servir como una interfaz simplemente implementándola.
```dart
 class Volador {
  void volar() {
    print('Volar');
  }
}
class Avion implements Volador {
  @override
  void volar() {
    print('El avión está volando');
  }
}
```

#### Abstracciones
No se pueden instanciar directamente. Esto permite que una clase defina métodos que las subclases deben implementar.
```dart
abstract class Animal {
  void hacerSonido();
}

class Gato extends Animal {
  @override
  void hacerSonido() {
    print('meow');
  }
}
```

### Enumeraciones
Permiten definir un conjunto de valores constantes y predefinidos. Por ejemplo:
```dart
enum Direccion { norte, sur, este, oeste }

void main() {
  var direccionActual = Direccion.norte;
  if (direccionActual == Direccion.norte) {
    print('norte');
  }
}
```

### Excepciones
Permiten manejar errores de manera controlada. Por ejemplo:
```dart
 void main() {
  try {
    int resultado = 100 ~/ 0;
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Siempre se ejecuta');
  }
}
```

### Colecciones
Se pueden almancenar múltiples valores con varios tipos de colecciones:
- `List`: para una lista ordenada donde puede haber elementos duplicados.
```dart
 List<int> numeros = [1, 2, 3];
```
  - `Añadir` un elemento:
    ```dart
     numeros.add(4);
    ```
  - `Borrar` un elemento determinado:
    ```dart
     numeros.remove(2);
    ```

- `Set`: para una colección sin duplicados.
```dart
Set<int> unicos = {1, 2, 3};
```

- `Map`: para colecciones de pares **clave-valor**.
```dart
Map<String, int> edad = {'Ana': 25, 'Juan': 30};
```
Podemos acceder al valor asociado a un clase:
```dart
print(edades['Ana']); // Salida: 25
```
Y **agregar** o **eliminar** pares:
```dart
edades['Luis'] = 28;  // Añadir
edades.remove('Juan'); // Eliminar
```

### Programación asíncrona
Dart permite manejar tareas asíncronas mediante el uso de:
- `Future`: representa el valor o error que devolverá en el futuro.
- `async`: definir una función asíncrona. La función no se ejecuta de inmediato, sino que devuelve un Future que será completado más tarde.
- `await`: se utiliza para esperar a que un **Future** complete su ejecución antes de continuar.

Por ejemplo:
```dart
import 'dart:async';  // NECESARIO PARA USAR FUTURE

// FUNCION QUE SIMULA PEDIR UNA PIZZA (tarda 3 segundos)
Future<String> pedirPizza() async {
  print('Pidiendo pizza...');
  await Future.delayed(Duration(seconds: 3)); // ESPERAR 3 SEGUNDOS
  return '¡Pizza entregada!';  // AL FINAL, LA PIZZA LLEGA
}

void main() async {
  print('Tengo hambre...');
  
  // LLAMAR A LA FUNCION pedirPizza Y ESPERAR QUE SE COMPLETE
  String resultado = await pedirPizza();
  
  // SOLO DESPUES DE ESPERAR MOSTRAMOS EL RESULTADO
  print(resultado);
  print('¡A comer!');
}

```


### Streams
Un `Stream` es una secuencia de eventos **asincrónicos**, los cuales se utilizan para manejar situaciones donde haya muchos datos que necesitan ser procesados a medida que se generan (clicks, toques,...)
El método `listen()` es una función que se utiliza en un Stream para "**escuchar**" los datos que el Stream emite en el tiempo. Permite reaccionar a cada valor que el Stream produce, una vez esté disponible. <br>

Con `listen()` se puede definir un `callback` para procesar cada dato que se emite. <br>

Además, se puede definir acciones a ejecutar cuando ocurra un error (`onError`) o cuando el Stream termine (`onDone`). <br> Por ejemplo:

```dart
void main() {
  // CREAMOS UN STREAM QUE EMITE NUMEROS DEL 1 AL 3 CON UNA PAUSA ENTRE CADA UNO
  Stream<int> numeros = Stream.periodic(Duration(seconds: 1), (x) => x + 1).take(3);

  // USAMOS listen() PARA ESCUCHAR LOS DATOS QUE EMITE EL Stream
  numeros.listen((data) {
      print('Recibido: $data');  // SE EJECUTA CADA VEZ QUE LLEGA UN DATO
    },
    onError: (error) {
      print('Error: $error');  // SE EJECUTA SI OCURRE UN ERROR
    },
    onDone: () {
      print('Stream terminado');  // SE EJECUTA CUANTO EL Stream FINALIZA
    }
  );
}
```

Otro ejemplo: Leer un archivo línea por línea usando el método `openRead()`.
```dart
// transform CONVIERTE BYTES A TEXTO Y LUEGO DIVIDE EL CONTENIDO EN LINEAS
Stream<String> lineas =
      archivo.openRead().transform(utf8.decoder).transform(LineSplitter()); 

lineas.listen((linea) { 
  print('Procesando línea: $linea'); // IMPRIME LA LINEA
  }, 
  onError: (e) => print('Ocurrió un error: $e'), 
  onDone: () => print('Lectura del archivo completa.'), 
  );
}
```

### Librerías 
- `dart:core`: Incorpora todas las funciones esenciales que se necesita para crear aplicaciones.
- `dart:math`: librería para cálculos.
- `dart:async`,`dart:io`,`dart:convert`,...


### Esquema básico de un proyecto
Archivos principales:
- `main.dart`.

Carpetas comunes:
- `lib/`: contiene el código fuente principal (clases y funciones).
- `test/`: Incluye los archivos de prueba.
- `bin/`: scripts ejecutables.
- `web/`: archivos para la ejecución web del proyecto.

Archivos configuración:
- `pubspec.yaml`: archivo de configuración para gestionar las dependencias del proyecto.
- `.gitignore`: define qué archivos ignorar para el control de versiones.

Comandos básicos:
- `dart run`: ejecuta el proyecto.
- `dart test`: corre las pruebas unitarias.

#### Archivo pubspec.yaml
- `name` and `description`.
- `version`.
- `environment`: versión SDK.
- `dependencies`.
- `dev_dependencies`.
- `flutter`: opciones de flutter.





---
>_IES Ribera de Castilla 24/25._
