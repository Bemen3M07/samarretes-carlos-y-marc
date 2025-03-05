import 'package:flutter/material.dart';
import 'TShirtCalculatorScreen.dart'; // Importa la pantalla de la calculadora de camisetas

void main() {
  runApp(const MyApp()); // Ejecuta la aplicación al iniciar
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Desactiva la bandera de depuración en la esquina superior derecha
      home: TShirtCalculatorScreen(), // Establece la pantalla inicial de la aplicación
    );
  }
}
