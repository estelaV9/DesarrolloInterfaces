import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repaso_examen/view/converter.dart';
import 'package:repaso_examen/view/settings.dart';
import 'package:repaso_examen/view_model/change_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChangeThemeProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          //'/transactions': (context) => Transactions(),
        },
        debugShowCheckedModeBanner: false,
        home: Settings());
  }
}
