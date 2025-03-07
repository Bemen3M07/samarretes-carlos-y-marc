import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Clase para gestionar las listas
class ListJoiner {
  final List<int> lista1;
  final List<int> lista2;

  ListJoiner(this.lista1, this.lista2);

  // Método para operar entre las listas
  List<int> operar(String Function(int, int) operation) {
    int maxLength = lista1.length < lista2.length ? lista1.length : lista2.length;
    List<int> result = [];
    for (int i = 0; i < maxLength; i++) {
      int value1 = i < lista1.length ? lista1[i] : 0;
      int value2 = i < lista2.length ? lista2[i] : 0;
      result.add(int.parse(operation(value1, value2)));  
    }
    return result;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const ListApp(),
      ),
    );
  }
}

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listas iniciales
    List<int> lista1 = [1, 2, 3, 4, 5];
    List<int> lista2 = [6, 7, 8, 9, 10];

    // Crear instancia de ListManager y obtener la lista resultante usando la multiplicación
    ListJoiner manager = ListJoiner(lista1, lista2);
    List<int> result = manager.operar((a, b) => (a * b).toString());

    return Column(
      children: [
        Text('Item: ${result[0]}'),
        Text('Item: ${result[1]}'),
        Text('Item: ${result[2]}'),
        Text('Item: ${result[3]}'),
        Text('Item: ${result[4]}'),
      ],
    );
  }
}
