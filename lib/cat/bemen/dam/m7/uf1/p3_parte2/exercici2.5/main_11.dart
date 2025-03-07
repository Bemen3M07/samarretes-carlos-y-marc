import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp11());  // Ejecuta la aplicación con el widget MainApp.
}

class MainApp11 extends StatefulWidget {
  const MainApp11({super.key});

  @override
  Estat createState() => Estat();  // Crea el estado asociado a MainApp.
}

class Estat extends State<MainApp11> {
  int score1 = 0;  // Puntuación del jugador 1.
  int score2 = 0;  // Puntuación del jugador 2.

  // Función para incrementar la puntuación de jugador 1.
  void incrementScore1() {
    setState(() {
      score1++;  // Aumenta la puntuación de jugador 1 en 1.
    });
  }

  // Función para incrementar la puntuación de jugador 2.
  void incrementScore2() {
    setState(() {
      score2++;  // Aumenta la puntuación de jugador 2 en 1.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(  // Coloca los elementos de manera vertical.
          children: [
            Row(  // Fila con las puntuaciones de los dos jugadores.
              children: [
                Text('           $score1              '),  // Muestra la puntuación de jugador 1.
                Text('           $score2              '),  // Muestra la puntuación de jugador 2.
              ],
            ),
            Row(  // Fila con los botones para aumentar las puntuaciones.
              children: [
                ElevatedButton(
                  onPressed: incrementScore1,  // Incrementa la puntuación de jugador 1 al presionar el botón.
                  child: const Text('Boton 1'),  // Texto del primer botón.
                ),
                ElevatedButton(
                  onPressed: incrementScore2,  // Incrementa la puntuación de jugador 2 al presionar el botón.
                  child: const Text('Boton 2'),  // Texto del segundo botón.
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
