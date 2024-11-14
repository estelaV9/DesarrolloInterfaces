import 'package:flutter/material.dart';

import 'Model/producto.dart';

/*EJERCICIO 21: Crea una pantalla DetallesProducto que reciba un objeto Producto desde la pantalla
principal. Al pulsar en un producto en la pantalla principal, se debe navegar a
DetallesProducto y mostrar los detalles del objeto.
 1. El diseño de la pantalla principal debe ser el mínimo para cumplir la
especificación.*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 21 Pagina 63',
      debugShowCheckedModeBanner: false, // QUITAR LA MARCA DEL DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PantallaPrincipal(title: 'Ejercicio 21 Pagina 63'),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  // DEFINIR EL ESTILO PARA LOS TEXTOS DE UN TAMAÑO DE 24
  final TextStyle style = const TextStyle(fontSize: 24);

  PantallaPrincipal({super.key, required this.title});

  final String title;

  // LISTA CON ALGUNOS PRODUCTOS
  final List<Product> listOfProducts = [
    Product('Hamburguesa Gourmet',
        'Hamburguesa de carne de res, queso cheddar y bacon con patatas.'),
    Product('Pizza Margherita',
        'Pizza clásica con salsa de tomate y mozzarella fresca.'),
    Product('Sushi California Roll',
        'Rollos de sushi rellenos de aguacate y pepino y surimi con salsa de soya y wasabi.'),
    Product('Tacos de Carnitas',
        'Tacos con carne de cerdo, cebolla, cilantro y salsa roja picante.'),
    Product(
        'Ensalada César', 'Ensalada con lechuga, pollo a la parrilla y queso.'),
    Product('Paella Valenciana',
        'Arroz con mariscos, pollo, conejo y verduras, con azafrán y caldo de mariscos.'),
    Product('Tarta de Limón',
        'Tarta con base de galleta, relleno de crema de limón y cubierta con merengue.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ejercicio 21 Pagina 63", style: style),
        centerTitle: true, // CENTRAR EL APPBAR
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          // ESPACIO INTERIOR DENTRO DEL CONTAINER
          margin: const EdgeInsets.symmetric(horizontal: 400, vertical: 50),
          // ESPACIO EXTERIOR ALREDEDOR DEL CONTAINER
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.shade100,
            // COLOR DE FONDO DEL CONTENEDOR
            borderRadius: BorderRadius.circular(15),
            // BORDES REDONDEADOS
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // COLOR DE LA SOMBRA
                spreadRadius: 5, // RANGO DE EXPANSIÓN DE LA SOMBRA
                blurRadius: 10, // INTENSIDAD DEL DESENFOQUE DE LA SOMBRA
                offset:
                    const Offset(0, 5), // DESPLAZAMIENTO DE LA SOMBRA (X, Y)
              ),
            ],
            border: Border.all(
              color: Colors.deepPurple, // COLOR DEL BORDE
              width: 2, // ANCHO DEL BORDE
            ),
          ),
          // CREAMOS OTRO CONTENEDOR PARA METER LA LISTA DE PRODUCTOS
          child: Container(
            // OCUPA EL TAMAÑO DEL ANTERIOR CONTAINER
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            // ESPACIO ENTRE ESTE CONTAINER Y EL ANTERIOR
            child: Column(
              children: [
                // TITULO PARA EL CONTENEDOR
                const Text(
                  "Lista de Productos",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),

                // EXPANDED PARA OCUPAR EL ESPACIO DISPONIBLE EN LA PANTALLA
                Expanded(
                  child: ListView(
                    children: [
                      ListTileGenerator(
                          title: listOfProducts[0].productName,
                          subtitle: listOfProducts[0].description),
                      // Divider(color: Colors.purple,)
                      ListTileGenerator(
                          title: listOfProducts[1].productName,
                          subtitle: listOfProducts[1].description),
                      ListTileGenerator(
                          title: listOfProducts[2].productName,
                          subtitle: listOfProducts[2].description),
                      ListTileGenerator(
                          title: listOfProducts[3].productName,
                          subtitle: listOfProducts[3].description),
                      ListTileGenerator(
                          title: listOfProducts[4].productName,
                          subtitle: listOfProducts[4].description),
                      ListTileGenerator(
                          title: listOfProducts[5].productName,
                          subtitle: listOfProducts[5].description),
                      ListTileGenerator(
                          title: listOfProducts[6].productName,
                          subtitle: listOfProducts[6].description),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// CLASE PARA GENERAR LISTTILE
class ListTileGenerator extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle style = const TextStyle(fontSize: 15);

  const ListTileGenerator(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_cart),
      title: Text(title, style: style),
      subtitle: Text(subtitle, style: style),
      onTap: () {
        Product p =
            Product(title, subtitle); // CUANDO SE PULSA, SE CREA EL PRODUCTO
        Navigator.push(
            context, // CONTEXTO ACTUAL
            MaterialPageRoute(
                builder: (context) => DetallesProductos(
                    product: p))); // SE PASA EL PRODUCTO PULSADO
      },
    );
  }
}

class DetallesProductos extends StatelessWidget {
  final Product product; // RECIBE UN PRODUCTO
  final TextStyle style = const TextStyle(fontSize: 15);

  const DetallesProductos({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Ejercicio 21 Pagina 63", style: style),
          centerTitle: true, // CENTRAR EL APPBAR
        ),
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(10),
          // ESPACIO INTERIOR DENTRO DEL CONTAINER
          margin: const EdgeInsets.symmetric(horizontal: 400, vertical: 50),
          // ESPACIO EXTERIOR ALREDEDOR DEL CONTAINER
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.shade100,
            // COLOR DE FONDO DEL CONTENEDOR
            borderRadius: BorderRadius.circular(15),
            // BORDES REDONDEADOS
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // COLOR DE LA SOMBRA
                spreadRadius: 5, // RANGO DE EXPANSIÓN DE LA SOMBRA
                blurRadius: 10, // INTENSIDAD DEL DESENFOQUE DE LA SOMBRA
                offset:
                    const Offset(0, 5), // DESPLAZAMIENTO DE LA SOMBRA (X, Y)
              ),
            ],
            border: Border.all(
              color: Colors.deepPurple, // COLOR DEL BORDE
              width: 2, // ANCHO DEL BORDE
            ),
          ),
          child: Column(
            children: [
              Text(
                product.productName,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              Text(
                product.description,
                style: style,
              )
            ],
          ),
        )));
  }
}