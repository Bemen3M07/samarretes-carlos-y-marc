import 'package:flutter_test/flutter_test.dart';
import 'lib/TShirtCalculatorModel.dart';



void main() {
  group('TShirtCalculatorModel', () {
    test('calculatePrice without discount', () {
      expect(TShirtCalculatorModel(numTShirts: 15, size: 'small').calculatePrice(), 118.5);
      expect(TShirtCalculatorModel(numTShirts: 15, size: 'medium').calculatePrice(), 124.5);
      expect(TShirtCalculatorModel(numTShirts: 15, size: 'large').calculatePrice(), 190.5);
    });

    test('calculatePrice with discount', () {
      // No discount
      expect(TShirtCalculatorModel(numTShirts: 15, size: 'small', discount: '').finalPrice(), 118.5);
      // 10% discount
      expect(TShirtCalculatorModel(numTShirts: 15, size: 'small', discount: '10%').finalPrice(), 106.65);
      // 20€ discount, total > 100€
      expect(TShirtCalculatorModel(numTShirts: 15, size: 'large', discount: '20€').finalPrice(), 170.5);
      // 20€ discount, total < 100€
      expect(TShirtCalculatorModel(numTShirts: 10, size: 'small', discount: '20€').finalPrice(), 79.0);
    });
  });
}
