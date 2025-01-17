import 'package:ejer_testing/widget/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Incrementar y decrementar el contador', (WidgetTester tester) async {
    // ENVUELVE EL WIDGET EN UN MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CounterWidget(),
        ),
      ),
    );

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
