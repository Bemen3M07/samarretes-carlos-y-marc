import 'package:flutter/material.dart';
import 't_shirt_calculator_logic.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  _TShirtCalculatorScreenState createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  int? _numTShirts;
  String? _size;
  String _offer = ''; // Opción por defecto
  double _price = 0.0;

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
            _buildTextInput(),
            const SizedBox(height: 20),
            const Text('Talla', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildRadioOption('Petita', 'small'),
            _buildRadioOption('Mitjana', 'medium'),
            _buildRadioOption('Gran', 'large'),
            const SizedBox(height: 20),
            const Text('Oferta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildDropdown(),
            const SizedBox(height: 20),
            _buildPriceDisplay(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInput() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Número de samarretes',
        hintText: 'Introdueix el número de samarretes',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          _numTShirts = int.tryParse(value);
          _calculatePrice();
        });
      },
    );
  }

  Widget _buildRadioOption(String text, String value) {
    return RadioListTile(
      title: Text(text),
      value: value,
      groupValue: _size,
      onChanged: (val) {
        setState(() {
          _size = val;
          _calculatePrice();
        });
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      value: _offer,
      items: const [
        DropdownMenuItem(value: '', child: Text('Sense descompte')),
        DropdownMenuItem(value: '10%', child: Text('Descompte del 10%')),
        DropdownMenuItem(value: '20€', child: Text('Descompte per quantitat')),
      ],
      onChanged: (value) {
        setState(() {
          _offer = value!;
          _calculatePrice();
        });
      },
    );
  }

  Widget _buildPriceDisplay() {
    return Text(
      _price > 0 ? 'Preu: $_price €' : '',
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
