import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp2());
}

// Definimos la clase MainApp, que extiende StatelessWidget porque no necesita estado mutable.
class MainApp2 extends StatelessWidget {
  // Constructor constante de la clase MainApp.
  const MainApp2({super.key});

  // Método build que construye la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold proporciona la estructura visual básica de la pantalla.
      home: Scaffold(
        // Establecemos el color de fondo de la pantalla en blanco.
        backgroundColor: Colors.white,
        // El widget Center alinea su hijo en el centro de la pantalla.
        body: Center(
          // Column organiza los widgets en una disposición vertical.
          child: Column(
            // Alineamos los elementos al centro de la columna.
            mainAxisAlignment: MainAxisAlignment.center,
            // Lista de widgets dentro de la columna.
            children: [
              // Texto principal con estilo personalizado.
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 24, // Tamaño del texto.
                  fontWeight: FontWeight.bold, // Negrita.
                  color: Colors.black, // Color negro.
                ),
              ),
              // Espaciador entre los textos.
              const SizedBox(height: 8),
              // Segundo texto con un estilo más pequeño y color gris.
              const Text(
                'Start learning now',
                style: TextStyle(
                  fontSize: 16, // Tamaño del texto.
                  color: Colors.grey, // Color gris.
                ),
              ),
              // Espaciador antes de los botones.
              const SizedBox(height: 32),
              // Primer botón (Login).
              ElevatedButton(
                // Acción cuando el botón es presionado (actualmente vacía).
                onPressed: () {},
                // Estilo del botón.
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, // Color de fondo del botón.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bordes redondeados.
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Relleno interno del botón.
                ),
                // Texto dentro del botón con estilo.
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              // Espaciador entre los botones.
              const SizedBox(height: 16),
              // Segundo botón (Register).
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, // Color de fondo del botón.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bordes redondeados.
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Relleno interno del botón.
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
