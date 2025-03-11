import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../../lib/Exercici05/t_shirt_calculator_logic.dart';  // Importa la app que deseas probar

void main() {
  testWidgets('Cálculo de precio de samarretes', (WidgetTester tester) async {
    // Lanza la app
    await tester.pumpWidget(const MyApp());  // Inicia la aplicación para interactuar con la interfaz de usuario

    // Simula la interacción con los campos de la UI
    await tester.enterText(find.byType(TextField), '5');  // Introduce '5' en el campo de texto para el número de camisetas
    await tester.tap(find.text('Petita'));  // Selecciona la opción 'Petita' para la talla pequeña
    await tester.tap(find.text('10%'));  // Selecciona el descuento del '10%' en el dropdown
    await tester.pumpAndSettle();  // Espera a que la interfaz de usuario se actualice después de las interacciones

    // Verifica el resultado
    expect(find.text('Preu: 59.25 €'), findsOneWidget);  // Verifica que el texto 'Preu: 59.25 €' está presente, lo que indica que el cálculo es correcto
  });
}
