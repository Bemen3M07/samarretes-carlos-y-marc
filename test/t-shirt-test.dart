import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/tshirt_calculator.dart'; 

void main() {
  group('TShirtCalculatorLogic', () {
    test('calculatePrice without discount', () {
      expect(TShirtCalculatorLogic.calculatePrice('small',35),
    });
  });
}