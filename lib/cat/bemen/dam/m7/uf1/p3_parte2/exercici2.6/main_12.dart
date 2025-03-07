import 'package:flutter/material.dart';

// Funció principal per executar l'aplicació
void main() {
  runApp(MainApp12());
}

// Widget principal de l'aplicació
class MainApp12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desactiva el banner de debug
      home: ShoppingListScreen(), // Pantalla de la llista de la compra
    );
  }
}

// Widget que mostra la llista de la compra
class ShoppingListScreen extends StatefulWidget {
  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

// Estat de la pantalla de la llista de la compra
class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // Controladors per a agafar el text de les caixes de text
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  
  // Llista que emmagatzema els ítems
  List<Map<String, String>> _items = [];

  // Mètode per afegir un element a la llista
  void _addItem() {
    // Agafem els valors dels controladors
    final String name = _nameController.text;
    final String amount = _amountController.text;

    // Si els valors no estan buits, afegim l'element a la llista
    if (name.isNotEmpty && amount.isNotEmpty) {
      setState(() {
        _items.add({'name': name, 'amount': amount});
      });
      // Netejem les caixes de text
      _nameController.clear();
      _amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')), // Títol de l'aplicació
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaiat per a la pantalla
        child: Column(
          children: [
            // Caixa de text per a introduir el nom de l'element
            TextField(
              controller: _nameController, // Associem el controlador
              decoration: InputDecoration(labelText: 'Name'), // Text suggerit
            ),
            // Caixa de text per a introduir la quantitat
            TextField(
              controller: _amountController, // Associem el controlador
              decoration: InputDecoration(labelText: 'Amount'), // Text suggerit
              keyboardType: TextInputType.number, // Teclat numèric
            ),
            SizedBox(height: 10), // Espai entre els elements
            ElevatedButton(
              onPressed: _addItem, // Acció quan es prem el botó
              child: Text('Add'), // Text del botó
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length, // Nombre d'elements a la llista
                itemBuilder: (context, index) {
                  // Construïm cada element de la llista
                  return ListTile(
                    title: Text(_items[index]['name']!), // Nom de l'element
                    trailing: Text(_items[index]['amount']!), // Quantitat
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
