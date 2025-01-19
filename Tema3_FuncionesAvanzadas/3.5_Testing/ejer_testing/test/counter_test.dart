import 'package:ejer_testing/model/counter.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('El valor del contador debería incrementarse', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}