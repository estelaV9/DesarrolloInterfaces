import 'package:flutter/material.dart';

/*EJERCICIO 17: Crea una pantalla de configuración con distintos elementos (textos,
botones…) un switch que permita cambiar entre modo claro y modo oscuro.
Al usar el switch, el tema de la aplicación debe cambiar de color.*/
void main() {
  runApp(const MyHomePage(
    title: 'Ejercicio 17',
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextStyle style = const TextStyle(fontSize: 24);
  late var isEncendido = false;
  late ThemeData themeData = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            width: 400,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(
              children: [
                Text("data", style: style),
                const SizedBox(
                  height: 20,
                ),
                Text("data", style: style),
                const SizedBox(
                  height: 20,
                ),
                Text("data", style: style),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Pulsar",
                      style: style,
                    )),
                Row(
                  children: [
                    Text(
                      "Switch",
                      style: style,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Switch(
                        value: isEncendido,
                        onChanged: (value) {
                          setState(() {
                            if (isEncendido) {
                              themeData = ThemeData.light();
                            } else {
                              themeData = ThemeData.dark();
                            }
                          });
                          isEncendido = !isEncendido;
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
