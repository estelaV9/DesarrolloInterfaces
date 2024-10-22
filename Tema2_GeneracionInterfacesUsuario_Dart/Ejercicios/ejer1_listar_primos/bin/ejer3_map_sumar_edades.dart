/*Define un Map que contenga pares clave-valor donde las claves sean los nombres
de personas y los valores sean la edad. Escribe una función que sume todas las
edades en el mapa y retorne el total. Luego, crea otra función que determine cuál es
la edad máxima y mínima en el mapa. Imprime los resultados.*/

void main() {
  Map<String, int> edad = {'Ana': 25, 'Juan': 30, 'Shrek': 28};
  print('La suma de las edades es: ${returnEdad(edad)}');
  print(returnEdadMinMax(edad));
}

int returnEdad(Map<String, int> edad) {
  int suma = 0;
  // RECORRER EL MAPA Y ACCEDER AL VALOR
  for (var entrada in edad.entries) {
    suma += entrada.value;
  }
  return suma; // RETORNA LA SUMA
} // FUNCION PARA RETORNAR LA SUMA DE LAS EDADES

String returnEdadMinMax(Map<String, int> edad) {
  // SE INICIALIZA EL MINIMO Y MAXIMO USANDO EL PRIMER VALOR DEL MAPA
  int minimo = edad.values.first;
  int maximo = edad.values.first;
  // RECORRER EL MAPA Y ACCEDER AL VALOR
  for (var entrada in edad.entries) {
    if (entrada.value > maximo) {
      maximo = entrada.value;
    } // SI LA EDAD ES MAYOR QUE EL MAXIMO, ENTONCES SE DECLARA COMO EL MAXIMO

    if (entrada.value < minimo) {
      minimo = entrada.value;
    } // SI LA EDAD ES MENOR QUE EL MINIMO, ENTONCES SE DECLARA COMO EL MINIMO
  } // RECORRER EL MAPA PARA ENCONTRAR LA EDAD MINIMA Y MAXIMA
  return "La edad maxima es $maximo y la edad minima es $minimo"; // RETORNA LA CADENA DE CUAL ES EL MAXIMO O EL MINIMO
} // FUNCION PARA RETORNAR LA EDAD MINIMA Y MAXIMA
