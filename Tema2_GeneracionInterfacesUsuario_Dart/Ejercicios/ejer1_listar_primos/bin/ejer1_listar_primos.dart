/* Ejercicio 1: Genera una lista de números primos hasta el que el
usuario introduzca por consola. */
import 'dart:io';

void main() {
  print('Introduzca un numero: ');
  String? numero = stdin.readLineSync();
  var numeroInt = int.parse(numero!);

  Set<int> primosUnicos = {}; // ARRAY PARA GUARDAR LOS NUMEROS SIN DUPLICARLO

  for (int i = 2; i <= numeroInt; i++) {
    bool esPrimo = true; // VARIABLE PARA SABER SI ES PRIMO O NO

    // VERIFICAR SI i ES DIVISIBLE POR ALGUN NUMERO MENOR QUE i
    for (int j = 2; j < i ~/ 2; j++) {
      if (i % j == 0) {
        esPrimo = false; // NO ES PRIMO Y SALE DE ESTE FOR
        break;
      } // SI ENCUENTRA UN DIVISOR SALE DE ESTE BUCLE
    } // RECORRE DESDE 2 HASTA LA DIVISION DE I ENTRE 2

    // SI EL NUMERO HA SIDO PRIMO, SE AÑADE A LA LISTA
    if (esPrimo) {
      primosUnicos.add(i);
    }
  } // FOR PARA RECORRER LA LISTA

  print('Los números primos hasta $numeroInt son: $primosUnicos');
}