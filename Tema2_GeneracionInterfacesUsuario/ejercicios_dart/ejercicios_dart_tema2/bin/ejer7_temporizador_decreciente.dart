/* Crea un temporizador que cada segundo imprima en la consola un valor
decreciente. Utiliza Stream.periodic y finaliza el temporizador cuando llegue a 0 */

void main() {
  var duracion = 10; // DEFINIMOS UNA VARIABLE QUE INDICA EL VALOR DE LA DURACION

  // CREAMOS UN STREAM QUE EMITE NUMEROS DEL 10 AL 0 CON UNA PAUSA ENTRE CADA UNO
  Stream<int> numeros =
  // Stream.periodic CREA UN STREAM QUE EMITE UN VALOR EN UN INTERVALO DE TIEMPO
  Stream.periodic(Duration(seconds: 1), (x) => duracion - x) // EMITE UN NÚMERO CADA SEGUNDO
  /** La función (x) => duracion - x se utiliza para generar una serie de números
  decrecientes desde el valor de duracion hasta 0.
  Cada segundo, el Stream emite el resultado de esta operación, proporcionando
  una cuenta regresiva en la salida.
  Basicamente, la x es como un for que aumenta cuando hace una devolucion de datos**/
      .take(duracion + 1); // LIMITA EL STREAM A 'duracion + 1' EMISIONES

  // USAMOS listen() PARA ESCUCHAR LOS DATOS QUE EMITE EL Stream
  numeros.listen((data) {
    print(data); // SE EJECUTA CADA VEZ QUE LLEGA UN DATO
  }, onError: (error) {
    print('Error: $error'); // SE EJECUTA SI OCURRE UN ERROR
  }, onDone: () {
    print('Stream terminado'); // SE EJECUTA CUANTO EL Stream FINALIZA
  });
}