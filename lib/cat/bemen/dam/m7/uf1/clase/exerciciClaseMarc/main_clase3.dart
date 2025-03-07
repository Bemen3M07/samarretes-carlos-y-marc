import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Clase para gestionar las listas
class ListJoiner {
  final List<int> list1;
  final List<int> list2;

  ListJoiner(this.list1, this.list2);

  // Método para operar entre las listas
  List<int> operar(String Function(int, int) operation) {
    int maxLength = list1.length < list2.length ? list1.length : list2.length;
    List<int> result = [];  // Cambiado a List<int>
    for (int i = 0; i < maxLength; i++) {
      int value1 = i < list1.length ? list1[i] : 0;
      int value2 = i < list2.length ? list2[i] : 0;
      result.add(int.parse(operation(value1, value2)));  // Convertimos el resultado a int
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
    List<int> list1 = [1, 2, 3, 9];
    List<int> list2 = [4, 5, 6, 7];

    // Crear instancia de ListManager y obtener la lista resultante usando la multiplicación
    ListJoiner manager = ListJoiner(list1, list2);
    List<int> resultMult = manager.operar((a, b) => (a * b).toString()); // Multiplicación

    return Column(
      children: [
        Text('Item: ${resultMult[0]}'),
        Text('Item: ${resultMult[1]}'),
        Text('Item: ${resultMult[2]}'),
        Text('Item: ${resultMult[3]}'),
      ],
    );
  }
}
