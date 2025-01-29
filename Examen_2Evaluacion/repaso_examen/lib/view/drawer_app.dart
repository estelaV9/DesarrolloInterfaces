import 'package:flutter/material.dart';
import 'package:repaso_examen/view/settings.dart';

// NO LLAMAR A LA CLASE DEL DRAWER APP SOLO DRAWER
// DA CONFLICTO CON EL WIDGET DRAWER
class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // ENCABEZADO DEL DRAWER
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
          ListTile(
            title: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.compare_arrows)),
                Text("Converter")
              ],
            ),
            // ACCION DE LA OPCION
            onTap: () {
              Navigator.pushNamed(context, '/converter');
            },
          ),
          ListTile(
            title: Row(
              children: [Icon(Icons.list), Text("Transactions")],
            ),
            // ACCION DE LA OPCION
            onTap: () {

            },
          ),
          ListTile(
            title: Row(
              children: [Icon(Icons.settings), Text("Settings")],
            ),
            // ACCION DE LA OPCION
            onTap: () {
              // IR A LA VENTANA DE AJUSTES
              Navigator.pushNamed(context, '/settings');
            },
          )
        ],
      ),
    );
  }
}
