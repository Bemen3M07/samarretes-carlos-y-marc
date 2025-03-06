import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  // Agrupa las pruebas relacionadas con la "Calculadora de Samarretes"
  group('Calculadora de Samarretes', () {
    FlutterDriver? driver; // El driver para controlar la aplicación en la prueba

    // Se establece la conexión al inicio de todos los tests
    setUpAll(() async {
      driver = await FlutterDriver.connect(); // Conecta al driver de Flutter
    });

    // Se cierra la conexión después de todos los tests
    tearDownAll(() async {
      if (driver != null) {
        await driver!.close(); // Asegúrate de usar '!' para acceder al valor
      }
    });

    // Test para verificar el cálculo del precio sin descuento
    test('Calcular precio de 2 camisetas pequeñas sin descuento', () async {
      // Given: Introducimos el número de camisetas
      await driver!.tap(find.byValueKey('num_t_shirts_input')); // Toca el campo de texto para el número de camisetas
      await driver!.enterText('2'); // Introduce el número 2

      // When: Seleccionamos la talla pequeña
      await driver!.tap(find.byValueKey('small_radio_button')); // Toca el botón de radio para seleccionar la talla pequeña

      // Y: Seleccionamos "Sin descuento"
      await driver!.tap(find.byValueKey('no_discount_dropdown')); // Toca el desplegable para seleccionar "Sin descuento"

      // Then: Comprobamos el precio final mostrado
      await driver!.waitFor(find.byValueKey('price_display')); // Espera hasta que el precio se muestre en la interfaz
      String priceText = await driver!.getText(find.byValueKey('price_display')); // Obtiene el texto del precio mostrado

      // Verifica que el precio calculado es correcto
      expect(priceText, 'Preu: 23.70 €'); // Compara el precio con el valor esperado
    });

    // Test para verificar el cálculo del precio con descuento del 10%
    test('Calcular precio con descuento del 10%', () async {
      // Given: Introducimos el número de camisetas
      await driver!.tap(find.byValueKey('num_t_shirts_input')); // Toca el campo de texto para el número de camisetas
      await driver!.enterText('3'); // Introduce el número 3

      // When: Seleccionamos la talla mediana
      await driver!.tap(find.byValueKey('medium_radio_button')); // Toca el botón de radio para seleccionar la talla mediana

      // Y: Seleccionamos el descuento del 10%
      await driver!.tap(find.byValueKey('discount_10_dropdown')); // Toca el desplegable para seleccionar el descuento del 10%

      // Then: Comprobamos el precio final con el descuento aplicado
      await driver!.waitFor(find.byValueKey('price_display')); // Espera hasta que el precio final se actualice
      String priceText = await driver!.getText(find.byValueKey('price_display')); // Obtiene el texto del precio final

      // Verifica que el precio calculado es correcto con el descuento
      expect(priceText, 'Preu: 33.16 €'); // Compara el precio con el valor esperado después de aplicar el descuento
    });
  });
}

