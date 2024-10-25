/* Ejercicio 5: Utiliza la librería http para realizar una petición GET a una API
pública (como JSONPlaceholder). Usa async y await para manejar la respuesta
asíncrona y muestra los datos en consola */

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  // DEFINIMOS EL HOST, QUE ES LA DIRECCIÓN DEL SERVIDOR DE LA API DE GOOGLE
  String host = 'www.googleapis.com';
  // DEFINIMOS LA RUTA DEL RECURSO, QUE ES EL ENDPOINT PARA ACCEDER A LOS
  // VOLUMENES DE LIBROS
  String dominioWeb = '/books/v1/volumes';
  // DEFINIMOS EL NOMBRE DEL PARÁMETRO QUE UTILIZAREMOS PARA LA CONSULTA DE
  // BÚSQUEDA (ES UN PARÁMETRO DE QUERY)
  String consultaBusqueda = 'q';


  // CONSTRUIMOS LA URI USANDO EL HOST, EL DOMINIO Y LOS PARÁMETROS DE BÚSQUEDA
  var url = Uri.https(
      host,  // EL HOST DEL API
      dominioWeb,  // LA RUTA DEL RECURSO QUE QUEREMOS CONSULTAR
      // AQUÍ DEFINIMOS LOS PARÁMETROS DE LA CONSULTA; 'q' SERÁ EL NOMBRE DEL
      // PARÁMETRO Y '{http}' SERÁ SU VALOR
      {consultaBusqueda: '{http}'}
  );


  // REALIZA UNA PETICIÓN HTTP GET A LA URL ESPECIFICADA Y ESPERA A QUE SE COMPLETE
  // GUARDAMOS EN UNA VARIABLE LA RESPUESTA DE LA CONSULTA
  // 'http.get(url)' HACE UNA SOLICITUD ASÍNCRONA AL SERVIDOR EN LA URL DEFINIDA
  var respuestaConsulta = await http.get(url);

  // SI LA RESPUESTA A LA CONSULTA ES 200 ES QUE HA REALIZADO CORRECTAMENTE LA SOLICITUD
  if(respuestaConsulta.statusCode == 200) {
    // DECODIFICAMOS LA RESPUESTA JSON DE LA PETICIÓN Y LA CONVERTIMOS A UN MAPA DE DART
    var jsonResponse = convert.jsonDecode(respuestaConsulta.body) as Map<String, dynamic>;

    // EXTRAEMOS EL NÚMERO TOTAL DE ELEMENTOS DEL JSON
    var cuenta = jsonResponse['totalItems'];  // 'totalItems' ES UNA CLAVE DEL OBJETO JSON
    print("El numero total de elemento es de $cuenta");  // IMPRIMIMOS EL NÚMERO TOTAL DE ELEMENTOS

    // INDENTAR EL JSON PARA MEJOR LEGIBILIDAD
    // SE CREA UN ENCODER JSON CON 2 ESPACIOS DE INDENTACIÓN
    var encoder = convert.JsonEncoder.withIndent('  ');
    // SE CONVIERTE EL OBJETO JSON A UNA CADENA FORMATEADA CON INDENTACIÓN
    var jsonFormateado = encoder.convert(jsonResponse);

    // IMPRIMIMOS EL JSON FORMATEADO PARA FACILITAR SU LECTURA
    print(jsonFormateado);  // SE IMPRIME EL JSON FORMATEADO EN LA CONSOLA

  } else {
    print('Ha ocurrido un error');
  }
}