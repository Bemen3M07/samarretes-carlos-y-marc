import 'package:flutter/material.dart';
import 't_shirt_calculator_logic.dart';

class TShirtCalculatorScreen extends StatefulWidget {
  const TShirtCalculatorScreen({super.key});

  @override
  _TShirtCalculatorScreenState createState() => _TShirtCalculatorScreenState();
}

class _TShirtCalculatorScreenState extends State<TShirtCalculatorScreen> {
  static const double smallPrice = TShirtCalculatorLogic.small;
  static const double mediumPrice = TShirtCalculatorLogic.medium;
  static const double largePrice = TShirtCalculatorLogic.large;

  int? _numTShirts;
  String? _size;
  String? _offer;
  double _price = 0.0;

  void _calculatePrice() {
    if (_numTShirts == null || _size == null) {
      setState(() => _price = 0.0);
      return;
    }
    setState(() {
      _price = (_offer == null)
          ? TShirtCalculatorLogic.preuDefinitiu(_numTShirts!, _size!, '')
          : TShirtCalculatorLogic.preuDefinitiu(_numTShirts!, _size!, _offer!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          MyTextInput(
            labelText: 'Samarretes',
            hintText: 'Número de samarretes',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _numTShirts = int.tryParse(value);
                _calculatePrice();
              });
            },
          ),
          const Text('Talla'),
          _buildRadioOption('Petita', 'small', smallPrice),
          _buildRadioOption('Mitjana', 'medium', mediumPrice),
          _buildRadioOption('Gran', 'large', largePrice),
          const SizedBox(height: 20),
          const Text('Oferta'),
          DropdownButton<String>(
            value: _offer,
            items: [
              DropdownMenuItem(value: '', child: const Text('Sense descompte')),
              DropdownMenuItem(value: '10%', child: const Text('Descompte del 10%')),
              DropdownMenuItem(value: '20€', child: const Text('Descompte per quantitat')),
            ],
            onChanged: (value) {
              setState(() {
                _offer = value;
                _calculatePrice();
              });
            },
            hint: const Text('Selecciona una oferta'),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Preu: \$_price €',
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String text, String value, double price) {
    return RadioListTile(
      title: Text('$text (\$price €)'),
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
}

class MyTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  const MyTextInput({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}


//ssass