import 'package:flutter/material.dart';
import 't_shirt_calculator_logic.dart'; // Importación de la lógica de cálculo

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
  String _offer = ''; // Inicializado para evitar errores
  double _price = 0.0;

  void _calculatePrice() {
    if (_numTShirts == null || _size == null) {
      setState(() => _price = 0.0);
      return;
    }
    setState(() {
      _price = (_offer.isEmpty)
          ? TShirtCalculatorLogic.calculatePrice(_size!, _numTShirts!)
          : TShirtCalculatorLogic.calculatePriceWithDiscount(_size!, _numTShirts!, _offer);

      // Mostrar alerta si la oferta es '20€' y la cantidad es mayor a 10
      if (_offer == '20€' && (_numTShirts ?? 0) > 10) {
        _showDiscountAlert();
      }
    });
  }

  void _showDiscountAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Descompte aplicat'),
          content: const Text('Has aplicat el descompte per quantitat!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('D’acord'),
            ),
          ],
        );
      },
    );
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
            value: _offer.isNotEmpty ? _offer : null,
            items: const [
              DropdownMenuItem(value: '', child: Text('Sense descompte')),
              DropdownMenuItem(value: '10%', child: Text('Descompte del 10%')),
              DropdownMenuItem(value: '20€', child: Text('Descompte per quantitat')),
            ],
            onChanged: (value) {
              setState(() {
                _offer = value ?? '';
                _calculatePrice();
              });
            },
            hint: const Text('Selecciona una oferta'),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Preu: ${_price.toStringAsFixed(2)} €',
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
      title: Text('$text (${price.toStringAsFixed(2)} €)'),
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
