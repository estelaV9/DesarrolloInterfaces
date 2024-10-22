/* Ejercicio 6: Crea un script que monitoree los cambios en un archivo
utilizando dart:io y Streams.
Cada vez que el archivo sea modificado, el script debería imprimir un mensaje
indicando la actualización */

import 'dart:io'; // IMPORTAMOS LA BIBLIOTECA 'dart:io' PARA TRABAJAR CON EL SISTEMA DE ARCHIVOS

void main() async {
  // DEFINIMOS LA RUTA DEL ARCHIVO QUE VAMOS A MONITOREAR
  // Y CREAMOS UNA INSTANCIA DEL ARCHIVO
  var file = File('bin\\script');

  // MONITOREAMOS CAMBIOS EN EL ARCHIVO USANDO UN STREAM
  // 'watch()' DEVUELVE UN STREAM QUE EMITE EVENTOS CUANDO HAY CAMBIOS EN EL ARCHIVO
  file.watch().listen((event) {
    switch(event.type) {
      case FileSystemEvent.create:
        // IMPRIMIMOS UN MENSAJE CON LA RUTA DEL ARCHIVO CREADO
        print('El archivo ha sido creado: ${event.path}');
        break;
      case FileSystemEvent.modify:
        // IMPRIMIMOS UN MENSAJE CON LA RUTA DEL ARCHIVO MODIFICADO
        print('El archivo ha sido modificado: ${event.path}');
        break;
      case FileSystemEvent.delete:
        // IMPRIMIMOS UN MENSAJE CON LA RUTA DEL ARCHIVO ELIMINADO
        print('El archivo ha sido eliminado: ${event.path}');
        break;
      case FileSystemEvent.move:
        // IMPRIMIMOS UN MENSAJE CON LA RUTA DEL ARCHIVO MOVIDO
        print('El archivo ha sido movido: ${event.path}');
        break;
    } // SWITCH PARA CADA TIPO DE EVENTO
  });
}