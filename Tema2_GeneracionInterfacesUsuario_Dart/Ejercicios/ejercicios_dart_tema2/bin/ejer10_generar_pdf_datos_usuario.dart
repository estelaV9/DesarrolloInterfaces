/* Ejercicio 10: Crea un programa que recoja información del usuario
(nombre, apellidos, email, dirección) por la línea de comandos y genere un PDF
estructurado con él. https://pub.dev/packages/pdf */

import 'dart:io'; // IMPORTA LA BIBLIOTECA PARA TRABAJAR CON ENTRADA Y SALIDA DE ARCHIVOS.
import 'package:pdf/pdf.dart'; // IMPORTA CLASES PARA MANEJAR FORMATO PDF.
import 'package:pdf/widgets.dart' as pw; // IMPORTA WIDGETS PARA CREAR DOCUMENTOS PDF.

void main() async {
  // SOLICITA AL USUARIO QUE INTRODUZCA SU NOMBRE.
  print('Introduzca su nombre: ');
  var nombre = stdin.readLineSync();

  // SOLICITA AL USUARIO QUE INTRODUZCA SUS APELLIDOS.
  print('Introduzca sus apellidos: ');
  var apellidos = stdin.readLineSync();

  // SOLICITA AL USUARIO QUE INTRODUZCA SU EMAIL.
  print('Introduzca su email: ');
  var email = stdin.readLineSync();

  // SOLICITA AL USUARIO QUE INTRODUZCA SU DIRECCIÓN.
  print('Introduzca su direccion: ');
  var direccion = stdin.readLineSync();


  // CREAMOS UNA CADENA QUE CONTIENE TODA LA INFORMACIÓN DEL USUARIO.
  String cadena = "Nombre: $nombre Apellidos: $apellidos Email: $email Direccion: $direccion";
  final pdf = pw.Document(); // CREAMOS UNA NUEVA INSTANCIA DE UN DOCUMENTO PDF.

  /* MOSTRAR EL CONTENIDO EN EL CENTRO DE LA PÁGINA (CÓDIGO COMENTADO)
   * pdf.addPage(pw.Page(
   *     pageFormat: PdfPageFormat.a4,
   *     build: (pw.Context context) {
   *       return pw.Center(
   *         child: pw.Text(cadena),
   *       ); // Center
   *     })); // Page
   */

  /* MOSTRAR EL CONTENIDO ARRIBA A LA IZQUIERDA. AÑADIMOS UNA PÁGINA AL DOCUMENTO PDF. */
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4, // DEFINIMOS EL FORMATO DE PÁGINA COMO A4.
      build: (pw.Context context) { // FUNCIÓN QUE CONSTRUYE EL CONTENIDO DE LA PÁGINA.
        return pw.Align( // ALINEA EL CONTENIDO.
          alignment: pw.Alignment.topLeft, // ALINEA EL TEXTO EN LA PARTE SUPERIOR IZQUIERDA.
          child: pw.Text(cadena), // CREACIÓN DEL TEXTO CON LA INFORMACIÓN DEL USUARIO.
        ); // Align
      })); // Page

  // DEFINIMOS LA RUTA Y NOMBRE DEL ARCHIVO PDF A GUARDAR.
  final file = File("bin/pdf/UserData.pdf");
  await file.writeAsBytes(await pdf.save()); // GUARDAMOS EL DOCUMENTO PDF EN EL ARCHIVO.
  print("PDF guardado como $file"); // MENSAJE DE CONFIRMACIÓN QUE INDICA QUE EL PDF HA SIDO GUARDADO.
}