import 'package:flutter/material.dart';

class ChangeThemeProvider extends ChangeNotifier {
  ThemeData? _themeData;

  ThemeData? get themeData => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    // NOTIFICA A LOS LISTENERS QUE EL ESTADO HA CAMBIADO
    notifyListeners();
  } // ESTABLECER EL TEMA ACUTAL

  void clearCubeType() {
    _themeData = null;
    notifyListeners();
  }
}
