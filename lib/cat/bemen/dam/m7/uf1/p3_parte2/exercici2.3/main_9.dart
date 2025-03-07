import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp9());  // Ejecuta la aplicación con el widget MainApp.
}

class MainApp9 extends StatefulWidget {
  const MainApp9({super.key});

  @override
  Estat createState() => Estat();  // Crea el estado asociado a MainApp.
}

class Estat extends State<MainApp9> {
  final TextEditingController _controller = TextEditingController();  // Controlador para el campo de texto.
  int randomNumber = Random().nextInt(11);  // Genera un número aleatorio entre 0 y 10.
  String message = '';  // Mensaje que se mostrará dependiendo del resultado.
  int attempts = 0;  // Contador de intentos.

  // Función para verificar la adivinanza del usuario.
  void checkGuess() {
    int userGuess = int.tryParse(_controller.text) ?? -1;  // Intenta convertir el texto del controlador a un número. Si no se puede, asigna -1.

    if (userGuess == randomNumber) {
      setState(() {
        message = 'Has encertat!';  // Mensaje si el número adivinado es correcto.
      });
    } else if (userGuess < randomNumber) {
      setState(() {
        message = 'El número que busques és més gran';  // Mensaje si el número ingresado es menor que el generado.
      });
    } else {
      setState(() {
        message = 'El número que busques és més petit';  // Mensaje si el número ingresado es mayor que el generado.
      });
    }

    setState(() {
      attempts++;  // Incrementa el contador de intentos.
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(  // Dispone los widgets de manera vertical.
          children: [
            TextField(
              controller: _controller,  // Asocia el controlador con el TextField.
              keyboardType: TextInputType.number,  // Configura el teclado para ingresar números.
              decoration: const InputDecoration(hintText: 'Endevina el número'),  // Texto de ayuda dentro del campo de texto.
            ),
            ElevatedButton(
              onPressed: checkGuess,  // Llama a la función checkGuess cuando se presiona el botón.
              child: const Text('Comprovar'),  // Texto del botón.
            ),
            Text(message),  // Muestra el mensaje generado según el resultado de la adivinanza.
            Text('Intentos: $attempts'),  // Muestra la cantidad de intentos realizados.
          ],
        ),
      ),
    );
  }
}
