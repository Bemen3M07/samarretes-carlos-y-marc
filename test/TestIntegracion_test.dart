import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';  // Asegúrate de que esta línea esté incluida para importar el paquete de pruebas
import '../lib/Exercici05/mainsamarretes.dart';  // Asegúrate de que esta sea la ruta correcta a tu aplicación

void main() {
  testWidgets('Cálculo de precio de samarretes', (WidgetTester tester) async {
    // Lanza la app
    await tester.pumpWidget(const MyApp());  // Inicia la aplicación para interactuar con la UI

    // Simula la interacción con los campos de la UI
    await tester.enterText(find.byType(TextField), '5');  // Introduce '5' en el campo de texto para el número de camisetas
    await tester.tap(find.text('Petita'));  // Selecciona la talla 'Petita' (pequeña)
    await tester.tap(find.text('10%'));  // Selecciona el descuento del 10%
    await tester.pumpAndSettle();  // Espera a que la UI se actualice después de las interacciones (es crucial para que se calcule el precio)

    // Verifica el resultado
    expect(find.text('Preu: 59.25 €'), findsOneWidget);  // Verifica que el precio calculado es el esperado (59.25 €)
  });
}
