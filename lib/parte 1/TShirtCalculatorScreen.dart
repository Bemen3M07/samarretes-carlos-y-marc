import 'package:flutter/material.dart';
import 't_shirt_calculator_logic.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  _TShirtCalculatorScreenState createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  int? _numTShirts; // Número de camisetas introducido por el usuario
  String? _size; // Tamaño seleccionado por el usuario
  String _offer = ''; // Opción de oferta seleccionada (por defecto ninguna)
  double _price = 0.0; // Precio calculado

  // Método para calcular el precio basado en la lógica de negocio
  void _calculatePrice() {
    if (_numTShirts == null || _size == null) {
      setState(() => _price = 0.0);
      return;
    }
    setState(() {
      _price = TShirtCalculatorLogic.preuDefinitiu(_numTShirts!, _size!, _offer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Samarretes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildTextInput(), // Campo de entrada para el número de camisetas
            const SizedBox(height: 20),
            const Text('Talla', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildRadioOption('Petita', 'small'), // Botón de radio para talla pequeña
            _buildRadioOption('Mitjana', 'medium'), // Botón de radio para talla mediana
            _buildRadioOption('Gran', 'large'), // Botón de radio para talla grande
            const SizedBox(height: 20),
            const Text('Oferta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildDropdown(), // Menú desplegable para seleccionar la oferta
            const SizedBox(height: 20),
            _buildPriceDisplay(), // Muestra el precio calculado
          ],
        ),
      ),
    );
  }

  // Método que crea el campo de entrada para el número de camisetas
  Widget _buildTextInput() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Número de samarretes',
        hintText: 'Introdueix el número de samarretes',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      keyboardType: TextInputType.number, // Asegura que solo se introduzcan números
      onChanged: (value) {
        setState(() {
          _numTShirts = int.tryParse(value); // Convierte la entrada en número
          _calculatePrice(); // Calcula el precio al cambiar la cantidad
        });
      },
    );
  }

  // Método para crear opciones de selección de talla con botones de radio
  Widget _buildRadioOption(String text, String value) {
    return RadioListTile(
      title: Text(text),
      value: value,
      groupValue: _size,
      onChanged: (val) {
        setState(() {
          _size = val; // Actualiza la talla seleccionada
          _calculatePrice(); // Calcula el precio al cambiar la talla
        });
      },
    );
  }

  // Método para construir el menú desplegable de ofertas
  Widget _buildDropdown() {
    return DropdownButton<String>(
      value: _offer,
      items: const [
        DropdownMenuItem(value: '', child: Text('Sense descompte')), // Opción sin descuento
        DropdownMenuItem(value: '10%', child: Text('Descompte del 10%')), // Descuento del 10%
        DropdownMenuItem(value: '20€', child: Text('Descompte per quantitat')), // Descuento por cantidad
      ],
      onChanged: (value) {
        setState(() {
          _offer = value!; // Actualiza la opción de descuento seleccionada
          _calculatePrice(); // Calcula el precio con el nuevo descuento
        });
      },
    );
  }

  // Método para mostrar el precio calculado
  Widget _buildPriceDisplay() {
    return Text(
      _price > 0 ? 'Preu: $_price €' : '', // Muestra el precio si es mayor a 0
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}