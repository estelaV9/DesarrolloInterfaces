/* Ejercicio 9:  Implementa una lista de tareas usando “Logger”, de tal manera
que en las diferentes funciones, se añada un log para ver si se ha añadido
la tarea, eliminado la tarea o se han visualizado las tareas pendientes.
https://pub.dev/packages/logger */

import 'package:logger/logger.dart'; // IMPORTAMOS LA BIBLIOTECA 'logger' PARA GESTIONAR LOS REGISTROS

// CREAMOS UNA INSTANCIA DEL LOGGER
final logger = Logger();

void main() {
  print('*********** TIPOS DE LOGGER **************');
  logger.d("Este es un mensaje de depuración");
  logger.i("Iniciando la aplicación");
  logger.w("Advertencia: La tarea ya existe");
  logger.e("Error: No se pudo conectar a la base de datos");
  logger.v("Detalles de la operación de tarea");
  logger.wtf("¡Error crítico, acción necesaria!");


  print('\n\n\n\n*************** EJERCICIO TAREAS **************');
  List<String> tareas = []; // INICIALIZAMOS UNA LISTA VACÍA PARA LAS TAREAS

  // AGREGAMOS TAREAS A LA LISTA
  agregarTarea(tareas, "Comprar leche");
  agregarTarea(tareas, "Hacer ejercicio");

  // VISUALIZAMOS LAS TAREAS PENDIENTES
  verTareas(tareas);

  // ELIMINAMOS UNA TAREA
  eliminarTarea(tareas, "Comprar leche");

  // VOLVEMOS A VISUALIZAR LAS TAREAS PENDIENTES
  verTareas(tareas);
}

// FUNCIÓN PARA AGREGAR UNA TAREA A LA LISTA
void agregarTarea(List<String> tareas, String tarea) {
  tareas.add(tarea); // AÑADIMOS LA TAREA A LA LISTA
  logger.i("Tarea añadida: $tarea"); // REGISTRAMOS QUE SE HA AÑADIDO UNA TAREA
}

// FUNCIÓN PARA ELIMINAR UNA TAREA DE LA LISTA
void eliminarTarea(List<String> tareas, String tarea) {
  if (tareas.remove(tarea)) { // INTENTAMOS ELIMINAR LA TAREA Y VERIFICAMOS SI SE HA ELIMINADO CON ÉXITO
    logger.i("Tarea eliminada: $tarea"); // REGISTRAMOS QUE SE HA ELIMINADO UNA TAREA
  } else {
    logger.w("La tarea '$tarea' no se encontró."); // SI NO SE ENCUENTRA LA TAREA, REGISTRAMOS UNA ADVERTENCIA
  }
}

// FUNCIÓN PARA VISUALIZAR LAS TAREAS PENDIENTES
void verTareas(List<String> tareas) {
  if (tareas.isEmpty) { // VERIFICAMOS SI LA LISTA DE TAREAS ESTÁ VACÍA
    logger.i("No hay tareas pendientes."); // REGISTRAMOS QUE NO HAY TAREAS
  } else {
    logger.i("Tareas pendientes:"); // REGISTRAMOS QUE SE VAN A LISTAR LAS TAREAS
    for (var tarea in tareas) { // RECORREMOS CADA TAREA EN LA LISTA
      logger.i(tarea); // REGISTRAMOS CADA TAREA EN LA CONSOLA
    }
  }
}