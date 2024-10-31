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
