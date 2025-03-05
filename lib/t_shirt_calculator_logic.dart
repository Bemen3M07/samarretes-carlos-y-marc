import 'package:flutter_test/flutter_test.dart';
import 't_shirt_calculator_logic.dart';

void main() {
  group('TShirtCalculatorLogic', () {
    // Prueba para calcular el precio sin descuento
    test('calculaPreuSamarretes - sin descuento', () {
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(10, 'small'), 118.5);
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(5, 'medium'), 62.25);
      expect(TShirtCalculatorLogic.calculaPreuSamarretes(3, 'large'), 171.0);
    });

    // Prueba para calcular el descuento
    test('calculaDescompte - con 10% y 20€ de descuento', () {
      expect(TShirtCalculatorLogic.calculaDescompte(120.0, '10%'), 12.0);  // 10% de descuento
      expect(TShirtCalculatorLogic.calculaDescompte(150.0, '20€'), 20.0);  // 20€ de descuento
      expect(TShirtCalculatorLogic.calculaDescompte(80.0, '20€'), 0.0);   // No aplica descuento
      expect(TShirtCalculatorLogic.calculaDescompte(110.0, '10%'), 11.0);  // 10% de descuento
    });

    // Prueba para calcular el precio definitivo
    test('preuDefinitiu - con descuento', () {
      expect(TShirtCalculatorLogic.preuDefinitiu(10, 'small', '10%'), 106.65);  // Aplicar descuento del 10%
      expect(TShirtCalculatorLogic.preuDefinitiu(10, 'medium', '20€'), 104.25); // Aplicar descuento de 20€
      expect(TShirtCalculatorLogic.preuDefinitiu(5, 'large', ''), 190.5);        // Sin descuento
    });
  });
}

class TShirtCalculatorLogic {
  // Precios por talla
  static const double small = 11.85;
  static const double medium = 12.45;
  static const double large = 19.05;

  // Calcula el precio sin descuento
  static double calculaPreuSamarretes(int numero, String talla) {
    double pricePerShirt = 0.0;
    switch (talla) {
      case 'small':
        pricePerShirt = small;
        break;
      case 'medium':
        pricePerShirt = medium;
        break;
      case 'large':
        pricePerShirt = large;
        break;
      default:
        throw Exception('Talla no válida');
    }
    return pricePerShirt * numero;
  }

  // Calcula el descuento aplicable
  static double calculaDescompte(double preu, String tipusDescompte) {
    double descompte = 0.0;
    if (tipusDescompte == '10%') {
      descompte = preu * 0.10;
    } else if (tipusDescompte == '20€' && preu > 100) {
      descompte = 20.0;
    }
    return descompte;
  }

  // Calcula el precio final después de aplicar el descuento
  static double preuDefinitiu(int numero, String talla, String descompte) {
    double preu = calculaPreuSamarretes(numero, talla);
    double descompteAplicado = calculaDescompte(preu, descompte);
    return preu - descompteAplicado;
  }
}

