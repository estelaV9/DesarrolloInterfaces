# Resumen ejercicios Flutter
## Ejercicio 1: mensaje de bienvenida
Dentro de la clase que modifica el estado, añadimos el metodo initState()
- `initState()`
```dart
@override
void initState() {
 super.initState();
 print("Bienvenido! - initState()");
} // METODO initState
```

- `build()`: construimos la interfaz
```dart
@override
Widget build(BuildContext context) {
 print("Construyendo la interfaz - build()");
 return Scaffold(
   appBar: AppBar(
     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     title: const Text("Ciclo de Vida del Widget"),
   ),
   body: const Center(
     child: Text(
       "¡Hola! Mira la consola para ver el ciclo de vida del widget.",
       style: TextStyle(fontSize: 18),
       textAlign: TextAlign.center,
     ),
   ),
 );
}
```
  
- `dispose()`: debajo del `build()` añadimos el método `dispose()`:
```dart
@override
void dispose() {
 print("Adiós! - dispose()");
 super.dispose();
}
```

## Ejercicio 2: Texto y Botones
> [!NOTE]
> Se puede definir el estilo y luego llamarlo. No tiene que ser un elemento `const`:
> ```dart
> // DEFINIMOS EL ESTILO DEL TEXTO PARA REUTILIZAR
> final TextStyle textStyle = const TextStyle(fontSize: 24);
> // PARA APLICAR EL ESTILO TIENE QUE SER UN WIDGET SIN CONST
> Text("Texto 1", style: textStyle,),
> ```

Se puede utilizar: 
- `SizedBox`: Crea un espacio vacío entre widgets, pero no añade márgenes alrededor de ningún widget. Actúa como un espaciador vacío, pero no afecta el widget que lo rodea.

- `Padding`: Envuelve un widget para crear márgenes internos alrededor de él, separándolo de otros widgets y del borde de su contenedor. Con Padding, el espacio (margen) se añade alrededor del widget envuelto.

## Ejercicio 3: Incrementar contador
Utilizar el método `setState()` para cambiar el estado de la variable contador:
```dart
int counter = 0; // ATRIBUTO CONTADOR INICIALIZADO EN 0
void onCounterAction() {
 setState(() {
   counter++; // INCREMENTAMOS EL CONTADOR
 }); // SETEAMOS EL ESTADO
} // METODO PARA INCREMENTAR EL CONTADOR
```

## Ejercicio 5: FloatingActionButton
Va metido dentro de un `Scaffold`.
```dart
// BOTON FLOATING ACTION (+)
floatingActionButton: FloatingActionButton(
  onPressed: () {
    incrementarContador(); // LLAMAR AL METODO INCREMENTAR CONTADOR
  },
  child: Icon(Icons.add), // ICONO DEL SIMBOLO '+'
),
```

## Ejercicio 7: Tarjeta dentro de un Container
Añadir sombras:
```dart
boxShadow: const [
  BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    offset: Offset(0, 5), // sombra hacia abajo
  ),
],
```

## Ejercicio 20: Navegación básica
Los dos son clases que extienden de `StatelessWidget`.
Ir a la pantalla B:
```dart
ElevatedButton(
  onPressed: () {
    // AQUÍ SE USA `Navigator.push` PARA IR A "PantallaB"
    Navigator.push(
      context, // CONTEXTO ACTUAL
      MaterialPageRoute(
        builder: (context) => const PantallaB(), // DEFINE QUE VAS A "PantallaB"
      ),
    );
  },
  child: const Text('Ir a Pantalla B'), // TEXTO DEL BOTÓN
),
```

Volver a la pantalla A:
```dart
child: ElevatedButton(
  onPressed: () {
    // AQUÍ SE USA `Navigator.pop` PARA VOLVER A LA PANTALLA ANTERIOR
    Navigator.pop(context); // CIERRA LA PANTALLA ACTUAL (VUELVE A "PantallaA")
  },
  child: const Text('Volver a Pantalla A'), // TEXTO DEL BOTÓN
)
```















---




# Resumen Ejercicios Dart

## Ejercicio 3: Sumar edades mapas y mostrar la edad mínima y maxima.
1. Declara un `map`.
```dart
Map<String, int> edad = {'Ana': 25, 'Juan': 30, 'Shrek': 28};
```
   
3. Recorrer el `map`.
```dart
// RECORRER EL MAPA Y ACCEDER AL VALOR
for (var entrada in edad.entries) {
  suma += entrada.value;
}
```
   
4. Usar el primer valor del `map`.
```dart
int minimo = edad.values.first;
int maximo = edad.values.first;
```


## Ejercicio 5: Realizar una petición get a una API
1. Añadir la dependencia http e importarla en el proyecto -> usar `Pub get` para descargar la librería.
```dart
dependencies:
  http: ^0.13.0

import 'package:http/http.dart' as http;
```



---
>_IES Ribera de Castilla 24/25._
