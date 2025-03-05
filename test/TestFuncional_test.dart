import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../lib/mainsamarretes.dart';  // Importa la app que deseas probar

void main() {
  testWidgets('Cálculo de precio de samarretes', (WidgetTester tester) async {
    // Lanza la app
    await tester.pumpWidget(const MyApp());

    // Simula la interacción con los campos de la UI
    await tester.enterText(find.byType(TextField), '5');  // Número de camisetas
    await tester.tap(find.text('Petita'));  // Talla pequeña
    await tester.tap(find.text('10%'));  // Descuento del 10%
    await tester.pumpAndSettle();

    // Verifica el resultado
    expect(find.text('Preu: 59.25 €'), findsOneWidget);  // Resultado esperado
  });
}
