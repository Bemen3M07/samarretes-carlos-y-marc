import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Calculadora de Samarretes', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();  // Asegúrate de usar '!' para acceder al valor
      }
    });

    test('Calcular precio de 2 camisetas pequeñas sin descuento', () async {
      // Introduce el número de camisetas
      await driver!.tap(find.byValueKey('num_t_shirts_input'));
      await driver!.enterText('2');
      
      // Selecciona la talla pequeña
      await driver!.tap(find.byValueKey('small_radio_button'));

      // Selecciona "Sin descuento"
      await driver!.tap(find.byValueKey('no_discount_dropdown'));

      // Comprueba el precio final
      await driver!.waitFor(find.byValueKey('price_display'));
      String priceText = await driver!.getText(find.byValueKey('price_display'));
      
      // Verifica que el precio calculado es correcto
      expect(priceText, 'Preu: 23.70 €');
    });

    test('Calcular precio con descuento del 10%', () async {
      // Introduce el número de camisetas
      await driver!.tap(find.byValueKey('num_t_shirts_input'));
      await driver!.enterText('3');
      
      // Selecciona la talla mediana
      await driver!.tap(find.byValueKey('medium_radio_button'));

      // Selecciona el descuento del 10%
      await driver!.tap(find.byValueKey('discount_10_dropdown'));

      // Comprueba el precio final
      await driver!.waitFor(find.byValueKey('price_display'));
      String priceText = await driver!.getText(find.byValueKey('price_display'));
      
      // Verifica que el precio calculado es correcto con descuento
      expect(priceText, 'Preu: 33.16 €');
    });
  });
}
