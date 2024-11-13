import 'package:flutter/material.dart';
/*EJERCICIO 15: Diseña una pantalla de perfil de usuario usando Stack para mostrar
una imagen de portada (fondo), un avatar redondeado superpuesto a la izquierda,
y el nombre del usuario a la derecha.
1. Añade un formulario debajo que permita editar los textos, guardarlos y que
cambien.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 15 Pagina 52',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaginaPantalla(title: 'Ejercicio 15 Pagina 52'),
    );
  }
}

class PaginaPantalla extends StatefulWidget {
  const PaginaPantalla({super.key, required this.title});

  final String title;

  @override
  State<PaginaPantalla> createState() => _StatePaginaPantalla();
}

class _StatePaginaPantalla extends State<PaginaPantalla> {
  String nombre = "";
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Ejercicio 15 Pagina 52",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Center(
          child: Container(
            width: 600,
            height: 600,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[100],
                border: Border.all(color: Colors.black38, width: 5),
                borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              const Text(
                "Perfil de Usuario",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
              ),
              Stack(
                children: [
                    Container(
                    width: 400.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((20)),
                        // AÑADIMOS AL CONTENEDOR LA IMAGEN DE FONDO ---> AssetImage
                        image: const DecorationImage(
                            image: AssetImage("assets/catWallpaper.jpg"),
                            fit: BoxFit.fill),
                        border: Border.all(color: Colors.black, width: 2)),
                  ),
                  Positioned(
                      // EL POSITIONED TIENE VALORES PARA PONER MARGIN
                      top: 37,
                      left: 30,
                      child: Row(children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                const AssetImage("assets/imagenPerfil.jpg"),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular((100)),
                                  // AÑADIMOS AL CONTENEDOR LA IMAGEN DE FONDO ---> AssetImage
                                  image: const DecorationImage(
                                      image:
                                          AssetImage("assets/imagenPerfil.png"),
                                      fit: BoxFit.fill),
                                  border: Border.all(
                                      color: Colors.lightBlueAccent, width: 2)),
                            )),
                        const Padding(padding: EdgeInsets.all(14)),
                        Text(
                          nombre,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        )
                      ]))
                ],
              ),
              const Padding(padding: EdgeInsets.all(20)),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // LOS HIJOS DEL COLUMN SE ALINEAN A LA IZQUIERDA
                      children: [
                        const Text(
                          "Nombre de usuario:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),

                        // PASAMOS EL CONTROLADOR DE NOMBRE A UN VIEWFORM
                        ViewForm(nameController: _nameController),
                        const Padding(padding: EdgeInsets.all(25)),

                        // PARA CENTRAR EL BOTON SE UTILIZA EL CENTER
                        Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    nombre = _nameController.text;
                                  });
                                },
                                child: const Text(
                                  "Actualizar Nombre",
                                  style: TextStyle(fontSize: 24),
                                ))),
                      ]))
            ]),
          ),
        ));
  }
}

class ViewForm extends StatelessWidget {
  final TextEditingController nameController;

  const ViewForm({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: nameController, // USAMOS EL CONTROLADOR PASANDO COMO PARAMETRO
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Nombre",
          hintText: "Escriba el nombre de usuario",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su nombre de usuario';
          }
          return null;
        },
      ),
    );
  }
}