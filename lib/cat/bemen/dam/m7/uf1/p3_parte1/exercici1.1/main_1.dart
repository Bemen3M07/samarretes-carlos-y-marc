import 'package:flutter/material.dart';

void main() {
  // runApp() inicializa y ejecuta la aplicación Flutter con el widget MainApp como raíz.
  runApp(const MainApp1());
}

// Definimos MainApp como una clase que extiende StatelessWidget, lo que significa que no tiene estado mutable.
class MainApp1 extends StatelessWidget {
  // Constructor constante de MainApp.
  const MainApp1({super.key});

  // Método build() que devuelve la estructura de la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // MaterialApp es el widget raíz de la aplicación, que configura temas, navegación y otras propiedades.
      home: Scaffold(
        // Scaffold proporciona una estructura visual básica como AppBar, Drawer, FloatingActionButton, etc.
        body: Center(
          // Center alinea su hijo en el centro de la pantalla.
          child: Text('Hello World'), // Muestra un texto en pantalla.
        ),
      ),
    );
  }
}
