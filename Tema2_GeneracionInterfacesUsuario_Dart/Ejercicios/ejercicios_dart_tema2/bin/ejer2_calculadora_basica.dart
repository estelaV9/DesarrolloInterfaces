/* Programa una calculadora básica. El usuario debe elegir una operación de un
   menú, introducir los diferentes números necesarios, y saldrá por pantalla la operación
   adecuada. */
import 'dart:io';

void main() {
  print('************ CALCULADORA ************');
  print('1 - Suma\n2 - Resta\n3 - Multiplicacion\n4 - Division');
  print('Introduzca una operacion: ');
  String? respuesta = stdin.readLineSync();
  var operacion = int.parse(respuesta!);

  // PEDIR AL USUAIRO QUE INTRODUZCA DOS NUMEROS
  print('Introduzca el primer número:');
  String? input1 = stdin.readLineSync();
  double num1 = double.parse(input1!);

  print('Introduzca el segundo número:');
  String? input2 = stdin.readLineSync();
  double num2 = double.parse(input2!);

  // EJECUTAR LA OPERACION SELECCIONADA
  switch (operacion) {
    case 1: // SUMA
      double suma = num1 + num2;
      print('Resultado: $num1 + $num2 = $suma');
      break;
    case 2: // RESTA
      double resta = num1 - num2;
      print('Resultado: $num1 - $num2 = $resta');
      break;
    case 3: // MULTIPLICACION
      double multiplicacion = num1 * num2;
      print('Resultado: $num1 * $num2 = $multiplicacion');
      break;
    case 4: // DIVISION
      if (num2 != 0) {
        double division = num1 / num2;
        print('Resultado: $num1 / $num2 = $division');
      } else {
        print('Error: No se puede dividir por 0.');
      }
      break;
    default:
      print('Opcion no valida');
  }
}