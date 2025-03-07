import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp7());  // Ejecuta la aplicación con el widget MainApp.
}

class MainApp7 extends StatefulWidget {
  const MainApp7({super.key});

  @override
  State createState() => Estat();  // Crea el estado asociado a MainApp, llamado Estat.
}

class Estat extends State<MainApp7> {
  String text = 'Good ?!';  // Inicializa la variable de texto con el valor "Good ?!".

  // Función para cambiar el texto, recibe un nuevo texto como parámetro.
  void canviarText(String newText) {
    setState(() {
      text = newText;  // Actualiza el estado del texto con el nuevo valor.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(  // Usa una columna para apilar widgets verticalmente.
          children: [
            Text(text),  // Muestra el texto actual en la pantalla.
            Row(  // Coloca los botones en una fila (horizontalmente).
              children: [
                ElevatedButton(
                  onPressed: () => canviarText('Good Morning'),  // Cambia el texto a "Good Morning" al presionar.
                  child: const Text('Morning'),  // Texto del botón "Morning".
                ),
                ElevatedButton(
                  onPressed: () => canviarText('Good Night'),  // Cambia el texto a "Good Night" al presionar.
                  child: const Text('Night'),  // Texto del botón "Night".
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
