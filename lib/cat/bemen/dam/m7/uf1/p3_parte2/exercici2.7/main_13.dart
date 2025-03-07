import 'package:flutter/material.dart';
import '../../p3_parte1/exercici1.1/main_1.dart';
import '../../p3_parte1/exercici1.2/main_2.dart';
import '../../p3_parte1/exercici1.3/main_3.dart';
import '../../p3_parte1/exercici1.4/main_4.dart';
import '../../p3_parte1/exercici1.5/main_5.dart';
import '../../p3_parte1/exercici1.6/main_6.dart';
import '../../p3_parte2/exercici2.1/main_7.dart';
import '../../p3_parte2/exercici2.2/main_8.dart';
import '../../p3_parte2/exercici2.3/main_9.dart';
import '../../p3_parte2/exercici2.4/main_10.dart';
import '../../p3_parte2/exercici2.5/main_11.dart';
import '../../p3_parte2/exercici2.6/main_12.dart';

void main() {
  runApp(MainApp13()); // Inicia la aplicación ejecutando MainApp13
}

// Clase principal de la aplicación
class MainApp13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 2.7', // Título de la aplicación
      theme: ThemeData(primarySwatch: Colors.blue), // Tema de la aplicación
      home: MainScreen(), // Pantalla principal de la app
    );
  }
}

// Pantalla principal que muestra los botones de navegación
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 2.7 Navegación')), // Barra de título
      body: Center(
        child: SingleChildScrollView( // Permite desplazamiento si hay muchos botones
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botones para navegar a los diferentes ejercicios
              _buildNavButton(context, 'Ejercicio 1', MainApp1()),
              _buildNavButton(context, 'Ejercicio 2', MainApp2()),
              _buildNavButton(context, 'Ejercicio 3', MainApp3()),
              _buildNavButton(context, 'Ejercicio 4', MainApp4()),
              _buildNavButton(context, 'Ejercicio 5', MainApp5()),
              _buildNavButton(context, 'Ejercicio 6', MainApp6()),
              _buildNavButton(context, 'Ejercicio 7', MainApp7()),
              _buildNavButton(context, 'Ejercicio 8', MainApp8()),
              _buildNavButton(context, 'Ejercicio 9', MainApp9()),
              _buildNavButton(context, 'Ejercicio 10', MainApp10()),
              _buildNavButton(context, 'Ejercicio 11', MainApp11()),
              _buildNavButton(context, 'Ejercicio 12', MainApp12()),
            ],
          ),
        ),
      ),
    );
  }

  // Método para crear un botón de navegación
  Widget _buildNavButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Espaciado alrededor del botón
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen), // Navega a la pantalla indicada
        ),
        child: Text(text), // Texto del botón
      ),
    );
  }
}
