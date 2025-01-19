import 'package:ejer_testing/widget/my_widget.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  testWidgets('MyWidget muestra un título y un mensaje', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    expect(find.text('T'), findsOneWidget);
    expect(find.text('M'), findsOneWidget);
  });
}