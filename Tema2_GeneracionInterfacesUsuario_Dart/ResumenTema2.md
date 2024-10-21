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

- `Set`: para una colección sin duplicados.
```dart
Set<int> unicos = {1, 2, 3};
```

- `Map`: para colecciones de pares **clave-valor**.
```dart
Map<String, int> edad = {'Ana': 25, 'Juan': 30};
```







---
>_IES Ribera de Castilla 24/25._
