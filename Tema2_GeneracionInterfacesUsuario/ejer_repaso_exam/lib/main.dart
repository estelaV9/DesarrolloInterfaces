import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 35),
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
                  child: Text("80 KG",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                )),
            Padding(padding: EdgeInsets.all(20)),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(),
                child: Slider(
                  min: 1.20,
                  max: 2.10,
                  value: 2.10,
                  onChanged: (double value) {},
                )),
            Padding(padding: EdgeInsets.all(20)),
            Container(
                height: 70,
                width: 110,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Center(
                  child: Text("1.70 m", style: TextStyle(fontSize: 28)),
                )),
            Padding(padding: EdgeInsets.all(20)),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(),
                child: Slider(
                  min: 1.20,
                  max: 2.10,
                  value: 2.10,
                  onChanged: (double value) {},
                )),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red)),
                child: Text("CALCULAR",
                    style: TextStyle(color: Colors.white, fontSize: 24)))
          ],
        ),
      ),
    );
  }
}
