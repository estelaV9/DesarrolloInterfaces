import 'package:ejer_testing/model/counter.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Pruebas de Counter', () {
    test('El valor inicial es 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });
    test('Incrementar aumenta el valor en 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    test('Decrementar disminuye el valor en 1', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}