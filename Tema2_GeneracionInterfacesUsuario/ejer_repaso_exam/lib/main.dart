import 'package:flutter/material.dart';
import 'DetallesImc.dart';
import 'Model/IMC.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio Repaso Examen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorPage(title: 'Calculadora IMC'),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {
  int kilosImc = 40; // ATRIBUTO PARA GUARDAR LOS KILOS
  double alturaImc = 1.20; // ATRIBUTO PARA GUARDAR LA ALTURA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 35),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Container(
                height: 70,
                width: 110,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Center(
                  child: Text(("$kilosImc KG") as String,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                )),
            const Padding(padding: EdgeInsets.all(20)),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(),
                child: Slider(
                  min: 40,
                  max: 100,
                  value: kilosImc.toDouble(),
                  onChanged: (double newvalue) {
                    setState(() {
                      kilosImc = newvalue.toInt();
                    });
                  },
                )),
            const Padding(padding: EdgeInsets.all(20)),
            Container(
                height: 70,
                width: 110,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Center(
                  child: Text("${alturaImc.toStringAsFixed(2)} m",
                      style: const TextStyle(fontSize: 28)),
                )),
            const Padding(padding: EdgeInsets.all(20)),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(),
                child: Slider(
                  min: 1.20,
                  max: 2.10,
                  value: alturaImc.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      alturaImc = value.toDouble();
                    });
                  },
                )),
            const Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {
                  Imc imc = Imc(kilosImc, alturaImc);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetallesImc(
                              imcPasado: imc, title: 'Calculadora IMC')));
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.zero, // Sin bordes redondeados
                      ),
                    )),
                child: const Text("CALCULAR",
                    style: TextStyle(color: Colors.white, fontSize: 24)))
          ],
        ),
      ),
    );
  }
}