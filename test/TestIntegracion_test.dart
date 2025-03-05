import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';  // Asegúrate de que esta línea esté incluida
import '../lib/Exercici05/mainsamarretes.dart';  // Asegúrate de que esta sea la ruta correcta a tu aplicación

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
