import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp3());
}

// Definimos la clase MainApp, que extiende StatelessWidget porque no necesita estado mutable.
class MainApp3 extends StatelessWidget {
  // Constructor constante de la clase MainApp.
  const MainApp3({super.key});

  // Método build que construye la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Scaffold proporciona la estructura visual básica de la pantalla.
      home: Scaffold(
        // El widget Center alinea su hijo en el centro de la pantalla.
        body: Center(
          // Column organiza los widgets en una disposición vertical.
          child: Column(
            // Alineamos los elementos al centro de la columna.
            mainAxisAlignment: MainAxisAlignment.center,
            // Lista de widgets dentro de la columna.
            children: [
              // Texto simple.
              Text('This is resource String'),
              
              // Widget de imagen que carga una imagen desde los assets.
              Image(
                // AssetImage permite usar una imagen almacenada en la carpeta de assets.
                image: AssetImage('assets/main313.png'),
                width: 200, // Ancho de la imagen.
                height: 200, // Alto de la imagen.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
