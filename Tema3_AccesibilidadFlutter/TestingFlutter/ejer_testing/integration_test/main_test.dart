import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ejer_testing/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('El contador se incrementa al presionar el botón',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget); // VERIFICAR VALOR INICIAL
    await tester.tap(find.byIcon(Icons.add)); // SIMULAR INTERACCION
    await tester.pumpAndSettle(); // VERIFICAR VALOR INCREMENTADO
    expect(find.text('1'), findsOneWidget);
  });
}
