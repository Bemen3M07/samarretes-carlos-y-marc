class TShirtCalculatorLogic {
  // Precios por talla: Se definen las constantes de precios para cada talla.
  static const double small = 11.85;
  static const double medium = 12.45;
  static const double large = 19.05;

  // Calcula el precio sin descuento, multiplicando el número de camisetas por el precio de la talla seleccionada.
  static double calculaPreuSamarretes(int numero, String talla) {
    double pricePerShirt = 0.0; // Variable para almacenar el precio por camiseta según la talla
    switch (talla) { // Se determina el precio según la talla seleccionada
      case 'small': // Si la talla es "small"
        pricePerShirt = small; // Asigna el precio para la talla pequeña
        break;
      case 'medium': // Si la talla es "medium"
        pricePerShirt = medium; // Asigna el precio para la talla mediana
        break;
      case 'large': // Si la talla es "large"
        pricePerShirt = large; // Asigna el precio para la talla grande
        break;
      default: // Si la talla no es válida
        throw Exception('Talla no vàlida'); // Lanza una excepción con un mensaje de error
    }
    // Calcula el precio total sin descuento multiplicando el precio por el número de camisetas, redondeado a 2 decimales
    return double.parse((pricePerShirt * numero).toStringAsFixed(2));
  }

  // Calcula el descuento aplicable según el tipo de descuento, redondeando a 2 decimales
  static double calculaDescompte(double preu, String tipusDescompte) {
    double descompte = 0.0; // Variable para almacenar el valor del descuento
    if (tipusDescompte == '10%') { // Si el tipo de descuento es "10%"
      descompte = preu * 0.10; // Calcula el descuento del 10% sobre el precio
    } else if (tipusDescompte == '20€' && preu > 100) { // Si el tipo de descuento es "20€" y el precio es mayor a 100
      descompte = 20.0; // Aplica un descuento fijo de 20€
    }
    // Retorna el descuento calculado, redondeado a 2 decimales
    return double.parse(descompte.toStringAsFixed(2));
  }

  // Calcula el precio final después de aplicar el descuento
  static double preuDefinitiu(int numero, String talla, String descompte) {
    double preu = calculaPreuSamarretes(numero, talla); // Llama a la función para calcular el precio sin descuento
    double descompteAplicado = calculaDescompte(preu, descompte); // Calcula el descuento aplicado
    // Calcula el precio final restando el descuento al precio original, redondeado a 2 decimales
    return double.parse((preu - descompteAplicado).toStringAsFixed(2));
  }
}
