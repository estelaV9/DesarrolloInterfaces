import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Number());
  }
}

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  int? number; 
  final TextEditingController numberCtrll = TextEditingController();
  bool? esNumeroPar;

  /// Determina si un número es par.
  ///
  /// Este método recibe un número entero como entrada y devuelve un
  /// valor booleano (`true` si es par, `false` si es impar).
  bool isPar(int number) {
    return number % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("¿Es un número par?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Formulario para introduccir un numero
            ///
            /// Solo se permiten numeros: `TextInputType.number`
            Form(
              child: TextFormField(
                controller: numberCtrll,
                keyboardType: TextInputType.number, // SOLO NUMEROS
                decoration: InputDecoration(labelText: "Introduce un número"),
              ),
            ),
            const SizedBox(height: 10),

            /// Botón para verificar el número ingresado.
            ///
            /// Este botón convierte el texto ingresado en un número entero y verifica si es par o impar.
            /// Si el valor ingresado no es un número válido, se muestra un mensaje de error con un `SnackBar`.

            ElevatedButton(
              onPressed: () {
                setState(() {
                  try {
                    number = int.parse(numberCtrll.text);
                    esNumeroPar = isPar(number!);
                  } catch (e) {
                    // SI NO ES UN NUMERO, MOSTRAMOS UN MENSAJE DE ERROR
                    esNumeroPar = null;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Por favor, introduce un número válido."),
                      ),
                    );
                  }
                });
              },
              child: const Text("Verificar"),
            ),
            const SizedBox(height: 20),

            /// Muestra el resultado de la verificación en un card.
            ///
            /// Si [esNumeroPar] no es nulo, se muestra un mensaje indicando si
            /// el número es par o impar.
            if (esNumeroPar != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    esNumeroPar!
                        ? "El número $number es par."
                        : "El número $number es impar.",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}