import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repaso_examen/view/converter.dart';
import 'package:repaso_examen/view/settings.dart';
import 'package:repaso_examen/view/transactions.dart';
import 'package:repaso_examen/view_model/change_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

void main() async{
  sqfliteFfiInit();
  final databaseFactory = databaseFactoryFfi;

  final dbPath = join(
      await databaseFactory.getDatabasesPath(), 'ejercicioconversiones.db');
  final database = await databaseFactory.openDatabase(dbPath);

  await database.execute("DROP TABLE IF EXISTS conversiones");

  // CREAR TABLA DE TAREAS SI NO EXISTE.
  try {
  await database.execute('''
CREATE TABLE IF NOT EXISTS conversiones (
  id INTEGER PRIMARY KEY,
  valor INTEGER,
  origen TEXT,
  destino TEXT,
  resultado REAL
);
INSERT INTO conversiones (id, valor, origen, destino, resultado)
VALUES
(1, 50, 'Kilometros', 'Millas', 39.05),
(2, 100, 'Metros', 'Kilometros', 40.90),
(3, 200, 'Millas', 'Kilometros', 29.0),
(4, 300, 'Kilometros', 'Millas', 35.70);
''');
  } catch (e) {
  debugPrint("Error al crear tablas: $e");
 }
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChangeThemeProvider(),
      child: MainApp(database: database),
    ),
  );
}

class MainApp extends StatelessWidget {
  final Database database;
  const MainApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    // OBTENEMOS EL TEMA ACTUAL
    final themeData = context.watch<ChangeThemeProvider>().themeData;
    return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [Locale('es'), Locale('en')],
        locale: Locale('en'),
        theme: themeData,
        routes: {
          //'/': (context) => MainPage(),
          '/settings': (context) => Settings(),
          '/converter': (context) => ConverterPage(),
          '/transactions': (context) => TransactionsPage(database: database),
        },
        debugShowCheckedModeBanner: false,
        home: Settings());
  }
}
