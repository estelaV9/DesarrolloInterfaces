import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ejer_testing/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Flujo completo de incremento y decremento',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    // VERIFICA EL VALOR INICIAL DEL CONTADOR
    expect(find.text('Valor: 0'), findsOneWidget);

    // INCREMENTAR
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Valor: 1'), findsOneWidget);

    // DECREMENTAR
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('Valor: 0'), findsOneWidget);
  });
}
