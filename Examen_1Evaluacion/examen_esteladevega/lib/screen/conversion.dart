import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  // AÑADIR LOS CONTROLADORES PARA LOS TEXTFIELDS
  final _cantidadController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, Map<String, double>> ratioCambios = {
    'USD': {'EUR': 0.85, 'JPY': 110.0, 'USD': 1.0},
    'EUR': {'USD': 1.18, 'JPY': 129.0, 'EUR': 1.0},
    'JPY': {'USD': 0.0091, 'EUR': 0.0077, 'JPY': 1.0},
  };

  late int index;

  String valorOrigen = "USD";
  String valorDestino = "USD";

  double cantidad = 0; // VALORES INICIALES
  var monedas = [
    const DropdownMenuItem(
      value: "USD",
      child: Text("USD"),
    ),
    const DropdownMenuItem(
      value: "EUR",
      child: Text("EUR"),
    ),
    const DropdownMenuItem(
      value: "JPY",
      child: Text("JPY"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 120,
                width: 250,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          const Text(
                            "Moneda de Origen: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropdownButton(
                            items: monedas,
                            onChanged: (value) {
                              setState(() {
                                // CAMBIA VALOR DEL STRING DE valorOrigen AL VALOR QUE SE HAYA PULSADO
                                valorOrigen = value.toString();
                              });
                            },
                            value: valorOrigen,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 120,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Moneda de Destino: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownButton(
                        items: monedas,
                        onChanged: (value) {
                          setState(() {
                            // CAMBIA VALOR DEL STRING DE valorOrigen AL VALOR QUE SE HAYA PULSADO
                            valorDestino = value.toString();
                          });
                        },
                        value: valorDestino,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                        key: _formKey, // ASIGNAMOS LA CLAVE DEL FORMULARIO
                        child: Row(children: [
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Cantidad: ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _cantidadController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Ingrese la cantidad",
                                        hintText: "Ingrese la cantidad",
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'La cantidad no puede estar vacía';
                                        }
                                        return null; // Retorna null si la validación pasa
                                      },
                                    ),
                                  ])))
                        ])),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // AÑADIRLO A UN CONTENEDOR Y DARLE UN TAMAÑO FIJO PARA QUE NO SE EXPANDA
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, double> mapaOrigen =
                            ratioCambios[valorOrigen]!;
                        double valorCambio = mapaOrigen[valorDestino]!;

                        setState(() {
                          cantidad = (double.parse(_cantidadController.text)) *
                              valorCambio;
                        });
                      }
                    },
                    style: const ButtonStyle(alignment: Alignment.center),
                    child: const Row(children: [
                      Icon(Icons.arrow_drop_down_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Convertir",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ]))),
            const Padding(padding: EdgeInsets.all(10)),
            (cantidad != 0)
                ? Card(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Text("Resultado: $cantidad $valorDestino"),
                    ),
                  )
                : const Padding(padding: EdgeInsets.all(0))
          ],
        ),
      ),
    );
  }
}
