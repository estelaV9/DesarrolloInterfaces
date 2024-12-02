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
  final List<DropdownMenuEntry<dynamic>> monedas = [
    const DropdownMenuEntry(label: "USD", value: 1),
    const DropdownMenuEntry(label: "EUR", value: 2),
    const DropdownMenuEntry(label: "JPY", value: 3),
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
              child: Container(
                height: 120,
                width: 250,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text(
                            "Moneda de Origen: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DropdownMenu(dropdownMenuEntries: monedas)
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
              child: Container(
                height: 120,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Moneda de Destino: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DropdownMenu(dropdownMenuEntries: monedas)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
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
                                  padding: EdgeInsets.all(20),
                                  child: Column(children: [
                                    Align(
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
            Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        const SizedBox(
                          height: 20,
                        );
                        // la intencion estaba en que se pulsara y saliera un card, pero no funciona jajs
                        Card(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 120,
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    "Resultado: " + _cantidadController.text,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(alignment: Alignment.center),
                    child: const Row(
                      children: [
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
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
