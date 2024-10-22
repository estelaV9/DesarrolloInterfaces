/* Ejercicio 8: Descarga una imagen desde una URL usando la librería http y
guarda el archivo en el sistema de archivos.
Asegúrate de utilizar await para esperar la descarga antes de continuar */

import 'dart:io'; // IMPORTAMOS LA BIBLIOTECA 'dart:io' PARA MANIPULAR ARCHIVOS Y DIRECTORIOS
import 'package:http/http.dart' as http; // IMPORTAMOS LA BIBLIOTECA 'http' PARA REALIZAR PETICIONES HTTP

void main() async { // DEFINIMOS LA FUNCIÓN PRINCIPAL COMO ASÍNCRONA
  // DEFINIMOS LA URL DE LA IMAGEN QUE VAMOS A DESCARGAR
  var enlaceUrl =
      "https://preview.redd.it/while-watching-shrek-the-movie-kept-glitching-out-and-v0-7qfrkptcwysa1.jpg?width=1080&crop=smart&auto=webp&s=d5e3a003b5dd3eb7e08ef29c6ee6c131c83af022";

  // PARSEAMOS LA URL PARA CREAR UN OBJETO URI
  var url = Uri.parse(enlaceUrl);

  // DEFINIMOS LA RUTA DONDE SE GUARDARÁ LA IMAGEN DESCARGADA
  var rutaGuardarImagen = "bin/Image/imagenShrek.png";

  // REALIZAMOS UNA PETICIÓN GET A LA URL Y ESPERAMOS LA RESPUESTA
  var respuestaConsulta = await http.get(url); // PETICIÓN A LA URL PARA OBTENER LA IMAGEN

  // VERIFICAMOS SI LA RESPUESTA TIENE UN CÓDIGO DE ESTADO 200 (OK)
  if (respuestaConsulta.statusCode == 200) {
    // SI LA PETICIÓN FUE EXITOSA, ESCRIBIMOS LOS BYTES DE LA IMAGEN EN UN ARCHIVO
    await File(rutaGuardarImagen).writeAsBytes(respuestaConsulta.bodyBytes);
  } else {
    // SI LA PETICIÓN FALLA, IMPRIMIMOS UN MENSAJE DE ERROR
    print("Ha ocurrido un error");
  }
}