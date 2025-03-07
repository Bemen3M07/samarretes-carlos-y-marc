import 'dart:math'; // Importa la librería para generar números aleatorios
import 'package:flutter/material.dart'; // Importa el framework Flutter para interfaces gráficas
import 'package:flutter_svg/flutter_svg.dart'; // Importa el paquete para manejar imágenes en formato SVG

void main() {
  runApp(MainApp10());
}


// Clase principal de la aplicación que extiende StatelessWidget
class MainApp10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de modo debug
      home: DiceRoller(), // Define la pantalla principal de la app
    );
  }
}

// Clase que define un widget con estado para manejar cambios dinámicos
class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState(); // Crea el estado asociado a este widget
}

// Estado asociado a DiceRoller
class _DiceRollerState extends State<DiceRoller> {
  int leftDiceNumber = 1; // Almacena el valor del dado izquierdo
  int rightDiceNumber = 1; // Almacena el valor del dado derecho

  // Método que genera valores aleatorios para ambos dados
  void rollDice() {
    setState(() { // Notifica a Flutter que el estado ha cambiado
      leftDiceNumber = Random().nextInt(6) + 1; // Genera un número entre 1 y 6
      rightDiceNumber = Random().nextInt(6) + 1; // Genera un número entre 1 y 6

      // Si ambos dados sacan un 6, muestra un mensaje de JACKPOT
      if (leftDiceNumber == 6 && rightDiceNumber == 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('JACKPOT!'), // Mensaje mostrado en la parte inferior
            duration: Duration(seconds: 2), // Duración del mensaje
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'), // Título de la barra superior
        centerTitle: true, // Centra el título en la AppBar
      ),
      body: Stack(
        children: [
          // Imagen de fondo que ocupa toda la pantalla
          Positioned.fill(
            child: Image.asset(
              'assets/tapestry.png', 
              fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
            ),
          ),
          // Contenido principal centrado
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Fila con los dos dados
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/dice_$leftDiceNumber.svg', // Imagen del dado izquierdo
                      width: 500, // Ancho del dado
                      height: 500, // Altura del dado
                    ),
                    SvgPicture.asset(
                      'assets/dice_$rightDiceNumber.svg', // Imagen del dado derecho
                      width: 500, // Ancho del dado
                      height: 500, // Altura del dado
                    ),
                  ],
                ),
                SizedBox(height: 20), // Espacio entre los dados y el botón
                ElevatedButton(
                  onPressed: rollDice, // Llama a la función rollDice al presionar el botón
                  child: Text('ROLL THE DICE'), // Texto del botón
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Ajusta el tamaño del botón
                    textStyle: TextStyle(fontSize: 18), // Tamaño del texto del botón
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}