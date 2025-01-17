import 'package:ejer_testing/widget/my_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MyButton responde al ser presionado', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp( //Necesita estar metido en MaterialApp para que funcione
        home: Scaffold(
          body: MyButton(onPressed: () {
            pressed = true;
          }),
        ),
      ),
    );
// Realiza el tap y verifica
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(pressed, isTrue);
  });
}