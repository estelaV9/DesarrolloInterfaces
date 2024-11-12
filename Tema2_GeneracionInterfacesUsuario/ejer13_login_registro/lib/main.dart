import 'package:flutter/material.dart';

/*EJERCICIO 13: Diseña una pantalla de bienvenida con un texto, una breve descripción
y botones de Login y Registro. Usa “SingleChildScrollView” para hacerla
desplazable en caso de que tengamos pantallas pequeñas. Añade mucho
texto para comprobarlo*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 13 Pagina 52',
      debugShowCheckedModeBanner: false, // QUITAR EL BANNER DE DEBUG
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 13 Pagina 52'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Ejercicio 13 Pagina 52",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Center(
          // PARA AGREGAR UN PADDING EXTERNO, EL HIJO ES PADDING, DENTRO METES EL VALOR Y EL CONTENEDOR
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.black, width: 5),
                ),

                // ESPACIO ENTRE EL CONTENIDO DEL CONTENEDOR Y EL BORDE DEL CONTENEDOR
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "Bienvenido a esta aplicación de Flutter",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // TEXTO EN NEGRITA
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        const Text(
                          "Descripción de la aplicación: \n",
                          style: TextStyle(
                            // SUBRAYAR EL TEXTO
                              fontSize: 24,
                              decoration: TextDecoration.underline),
                        ),
                        const Text(
                          "Había una vez, en elreino Muy Muy Lejos...El Rey y la Reina fueronbendecidos con una hermosa "
                              "hija.A través de todo el reino,todos estaban felices.Hasta que se puso el sol. "
                              "Yse dieron cuenta que la niña,estaba maldecida de un hechizo malévolo,que tomaba lugar todas "
                              "las noches.Desesperados buscaron ayuda en una Hada madrina,la cual encerró a la princesa en "
                              "una torre,para así esperar el besodel apuesto príncipe Encantador!Fue él quien tuvo que soportar "
                              "elpeligroso camino, a través de...tierras heladas y calurosos desiertos.Viajando por muchos días "
                              "y noches.Arriesgándo la vida para llegara la guarida del dragón.Pues él era, el másvaliente, y más "
                              "hermoso...de todas las tierras. Yera cuestión del destino,que su beso rompería con el hechizo."
                              "Sólo él podría llegar al cuartomás alto de la torre más alta.Para entrar al cuarto de la princesa,"
                              "atravesar el cuarto hasta la cama,mover las cortinas a unalado para encontrar...- ¿Qué?- ¿Princesa "
                              "Fiona?- No.- Bueno, gracias a Dios.- ¿Dónde está?- Está en su luna de miel.¿Luna de miel? "
                              "¿Con quien?El escondite de luna de miel de Hansel.Me hace querer regresar yenfrentarme pero no sé "
                              "nada de amor.Vamos, vamos, un poco más rápido Vamos, vamos, el mundo nos seguirá,Vamos, vamos, todosestán "
                              "detrás del amor.Como dije soy un corredor de la nieveCorriendo justo haciala primavera que viene.Todo es amor. "
                              "Derritiéndomebajo el cielo azul,Rodeado de la luz del sol, Trémulo amor.Bueno nena, me rindo Al helado de "
                              "fresaNunca terminará todo este amor.Bueno, no fue mi intención perono hay forma de escapar de tu amor.Estas líneas de "
                              "luz significanque nunca estaremos solos,Nunca solos, no, no.Vamos, vamos, salta un poco más.Vamos, vamos, "
                              "Te sientoun poco más ligero.Vamos, vamos, Nosotrosestuvimos una vez enamorados.Accidentalmente enamorados."
                              "¡Accidentalmente enamorados!Es tan bueno volver a casa.Tu y yo, y...¿Burro?Shrek, Fiona!Dichosos los ojos que los ven."
                              "Dame un abrazo, Shrek, tu viejamaquina de amor!Y mirese usted, sra. shrek, ¿que tal un beso dulce?- "
                              "¿Qué estás haciendo aquí?- Sólo cuidaba de tu nido de amor.Si, claro, como ordenar lacorrespondencia, regar las plantas."
                              "Si, y darles de comer a los peces.Yo no tengo peces.Pues ahora ya los tienes.Se llaman Shrek y Fiona."
                              "Ese Shrek es un pequeño demonio.Mira la hora, que lastima,creo que hora de que te vayas",
                          style: TextStyle(fontSize: 20),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        // PADDING ENTRE EL TEXTO Y LOS BOTONER

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // MOSTRAR UNA ALERTA
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Login"),
                                        content: const Text("Te has logeado."),
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
                                    },
                                  );
                                },
                                child: (const Text("LOGIN",
                                    style: TextStyle(fontSize: 24)))),
                            // TEXTO DEL BOTON

                            const Padding(
                              padding: EdgeInsets.only(left: 100, right: 100),
                            ),
                            // PADDING ENTRE LOS BOTONES

                            ElevatedButton(
                                onPressed: () {
                                  // MOSTRAR UNA ALERTA
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Registro"),
                                        content:
                                        const Text("Te has registrado."),
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
                                    },
                                  );
                                },
                                child: (const Text("REGISTRO",
                                    style: TextStyle(fontSize: 24))))
                            // TEXTO DEL BOTON
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}