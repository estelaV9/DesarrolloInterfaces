import 'package:flutter/material.dart';

/*EJERCICIO 14: Crea un formulario que tenga campos de texto para nombre, correo
electrónico y contraseña. Añade un botón de envío que valide que todos los
campos están completos y que el correo electrónico es correcto*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 14 Pagina 53',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 14 Pagina 53'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // AÑADIR LOS CONTROLADORES PARA LOS TEXTFIELDS
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Creamos una clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  // METODO PARA MANEJAR EL ENVIO DEL FORMULARIO
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // SI EL FORMULARIO ES VALIDO MOSTRAMOS UNA ALERTA
      final name = _nameController.text;

      // MOSTRAR ALERTA
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Formulario", style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text("Se ha enviado correctamente, $name."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // CIERRA EL DIALOGO
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Ejercicio 14 Pagina 53",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Padding(
          // PADDING QUE VA A TENER EL FORMULARIO
          padding: const EdgeInsets.all(30),
          child: Form(
              key: _formKey, // ASIGNAMOS LA CLAVE DEL FORMULARIO
              child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black38, width: 5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          "Formulario",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nombre",
                            hintText: "Escriba su nombre",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu nombre';
                            }
                            return null; // Retorna null si la validación pasa
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Correo Electronico",
                            hintText: "Escriba su correo",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su correo';
                            }
                            return null; // Retorna null si la validación pasa
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),

                        TextFormField(
                          controller: _passwordController,
                          obscureText: true, // HACE QUE LAS PALABRAS SE CONVIERTAN EN PUNTOS
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Contraseña",
                            hintText: "Escriba su contraseña",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null; // Retorna null si la validación pasa
                          },
                        ),

                        const Padding(padding: EdgeInsets.all(40)),

                        // BOTON PARA ENVIAR EL FORMULARIO
                        ElevatedButton(
                          onPressed: _submitForm, // LLAMA AL METODO DE ENVIAR FORMULARIO
                          child: const Text('Enviar', style: TextStyle(fontSize: 24),),
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
