import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'drawer_app.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final _formKey = GlobalKey<FormState>();
  final valorConversor = TextEditingController();

  Map<String, Map<String, double>> conversionRates = {
    'km': {'km': 1.0, 'm': 1000.0, 'mll': 0.621371},
    'm': {'km': 0.001, 'm': 1.0, 'mll': 0.000621371},
    'mll': {'km': 1.60934, 'm': 1609.34, 'mll': 1.0},
  };

  double totalConversor = 0.0;
  String firstValue = "km";
  String secondValue = "mll";

  var conversion = [
    DropdownMenuItem(value: "km", child: Text("Kilómetros")),
    DropdownMenuItem(value: "m", child: Text("Metros")),
    DropdownMenuItem(value: "mll", child: Text("Millas")),
  ];

  void calcularConversor() {
    // OBTIENE EL MAPA DE TASAS DE CONVERSIÓN SEGÚN EL VALOR DE 'firstValue'
    Map<String, double> mapaOrigen = conversionRates[firstValue]!;

    // OBTIENE EL FACTOR DE CONVERSIÓN PARA EL VALOR DE 'secondValue'
    double valorDestino = mapaOrigen[secondValue]!;

    // ACTUALIZA EL ESTADO CON EL RESULTADO DE LA CONVERSIÓN
    setState(() {
      totalConversor = double.parse(valorConversor.text) * valorDestino;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.converter),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: valorConversor,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.enterValue,
                    hintText: AppLocalizations.of(context)!.enterValue),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, introduce un número";
                  } // SI ES NULO MANDA MENSAJE

                  final regex = RegExp(r'^\d+(\.\d{1,2})?$');
                  if (!regex.hasMatch(value)) {
                    return "Solo se permiten hasta 2 decimales";
                  } // SI PONE MAS DE DOS DECIMALES, MANDA MENSAJE
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              items: conversion,
              onChanged: (value) {
                setState(() {
                  firstValue = value!;
                });
              },
              value: firstValue,
            ),
            DropdownButton<String>(
              items: conversion,
              onChanged: (value) {
                setState(() {
                  secondValue = value!;
                });
              },
              value: secondValue,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // SI LOS DATOS SON CORRECTOS MOSTRAMOS UN SNACKBAR Y CALCULAMOS
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Formulario Enviado')),
                  );
                  calcularConversor();
                } else {
                  // SI NO, MOSTRAMOS UN MENSAJE
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Por favor, complete el formulario correctamente')),
                  );
                }
              },
              child: Text(AppLocalizations.of(context)!.convertAndSave),
            ),
            SizedBox(height: 20),
            (totalConversor != 0.0)
                ? Text(
                    "${AppLocalizations.of(context)!.result}: ${totalConversor.toStringAsFixed(2)}")
                : Padding(padding: EdgeInsets.all(20))
          ],
        ),
      ),
    );
  }
}
