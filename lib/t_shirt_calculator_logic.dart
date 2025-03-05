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
        throw Exception('Talla no vàlida');
    }
    return double.parse((pricePerShirt * numero).toStringAsFixed(2));
  }

  // Calcula el descuento aplicable, asegurando que siempre redondea a 2 decimales
  static double calculaDescompte(double preu, String tipusDescompte) {
    double descompte = 0.0;
    if (tipusDescompte == '10%') {
      descompte = preu * 0.10;
    } else if (tipusDescompte == '20€' && preu > 100) {
      descompte = 20.0;
    }
    return double.parse(descompte.toStringAsFixed(2));
  }

  // Calcula el precio final después de aplicar el descuento
  static double preuDefinitiu(int numero, String talla, String descompte) {
    double preu = calculaPreuSamarretes(numero, talla);
    double descompteAplicado = calculaDescompte(preu, descompte);
    return double.parse((preu - descompteAplicado).toStringAsFixed(2));
  }
}
