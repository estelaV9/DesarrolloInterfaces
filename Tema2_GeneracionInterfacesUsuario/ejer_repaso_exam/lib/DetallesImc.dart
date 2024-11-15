import 'package:flutter/material.dart';

import 'Model/IMC.dart';
import 'main.dart';

class DetallesImc extends StatelessWidget {
  final Imc imcPasado;
  final String title;

  final double imcCalculado = 0;

  const DetallesImc({super.key, required this.imcPasado, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(fontSize: 35),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(30)),
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(color: Colors.grey),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Text( // CALCULA EL IMC
                    (imcPasado
                        .calcularImc(imcPasado)
                        .toStringAsPrecision(3)
                        .toString()),
                    style: const TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
                  ),

                  const Padding(padding: EdgeInsets.all(20)),

                  // LLAMA AL METODO INFORMACION IMC PARA, SEGUN EL IMC CALCULADO, MUESTRE UN MENSAJE
                  Text(
                    imcPasado.informacionImc(imcPasado.calcularImc(imcPasado)),
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(80)),
            ElevatedButton(
                onPressed: () {
                  // NAVEGA A LA PAGINA PRINCIPAL
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalculatorPage(title: title)));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // SIN REDONDEAR BORDES
                    ),
                  ),
                  // "AUMENTA" EL TAMAÑO DEL BOTON AUMENTANDO EL ESPACION INTERNO
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
                ),
                child: const Text("NUEVO IMC",
                    style: TextStyle(color: Colors.white, fontSize: 24)))
          ],
        ),
      ),
    );
  }
}