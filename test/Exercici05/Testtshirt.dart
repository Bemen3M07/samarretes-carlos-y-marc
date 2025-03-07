import 'package:flutter_test/flutter_test.dart';
import 'package:samarretes/Exercici05/t_shirt_calculator_logic.dart';

void main() {
  group('TShirtCalculatorLogic', () {
    test('calculaPreuSamarretes without discount', () {
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(15, 'small'), 118.5);
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(15, 'medium'), 124.50000000000001);
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(15, 'large'), 190.5);
    });

    test('preuDefinitiu with discount', () {
      // No discount
      expect(TShirtCalculatorLogic.preuDefinitiu(15, 'small', ''), 118.5);
      // 10% discount
      expect(TShirtCalculatorLogic.preuDefinitiu(15, 'small', '10%'), 106.65);
      // 20€ discount, total > 100€
      expect(TShirtCalculatorLogic.preuDefinitiu(15, 'large', '20€'), 170.5);
      // 20€ discount, total < 100€
      expect(TShirtCalculatorLogic.preuDefinitiu(10, 'small', '20€'), 79.0);
    });

    test('Invalid size should throw an exception', () {
      expect(() => TShirtCalculatorLogic.calculaPreuSamarretes(10, 'extra-large'),
          throwsException);
    });
  });
}
