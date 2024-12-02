import 'package:flutter/material.dart';

class AjustesPage extends StatefulWidget {
  const AjustesPage({super.key});

  @override
  State<AjustesPage> createState() => _AjustesPageState();
}

class _AjustesPageState extends State<AjustesPage> {
  late var isEncendido = false;

  late int index;

  final List<DropdownMenuEntry<dynamic>> idiomas = [
    const DropdownMenuEntry(label: "Español", value: 1),
    const DropdownMenuEntry(label: "Inglés", value: 2),
    const DropdownMenuEntry(label: "Aleman", value: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Idioma",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // SE EXPANDE EL ESPACIO PARA QUE OCUPE TODOO EL ESPACIO
                        // EN BLANCO QUE APAREZCA ENTRE EL TEXTO Y EL DROPDOWNMENU
                        const Expanded(
                            child: SizedBox(
                          width: 950,
                        )),
                        DropdownMenu(dropdownMenuEntries: idiomas)
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.dark_mode),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Tema Oscuro",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SE EXPANDE EL ESPACIO PARA QUE OCUPE TODOO EL ESPACIO
                        // EN BLANCO QUE APAREZCA ENTRE EL TEXTO Y EL DROPDOWNMENU
                        const Expanded(
                            child: SizedBox(
                          width: 950,
                        )),
                        Switch(
                            value: isEncendido,
                            onChanged: (value) {
                              setState(() {
                                if (isEncendido) {
                                } else {}
                                isEncendido = !isEncendido;
                              });
                            })
                      ],
                    ),
                  ),
                )),
                const Padding(padding: EdgeInsets.all(20)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
