import 'package:flutter/material.dart';
import 'TShirtCalculatorScreen.dart';  // Importa la pantalla de la calculadora de camisetas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Camisetas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TShirtCalculatorScreen(),  // Define la pantalla principal
    );
  }
}
  