import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Clase para gestionar las listas
class ListJoiner {
  final List<int> list1;
  final List<int> list2;

  ListJoiner(this.list1, this.list2);

  // Método para sumar las lista
  List<int> sumLists() {
    int maxLength = list1.length > list2.length ? list1.length : list2.length;
    List<int> result = List.generate(maxLength, (index) {
      int value1 = index < list1.length ? list1[index] : 0;
      int value2 = index < list2.length ? list2[index] : 0;
      return value1 + value2;
    });
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

    // Crear instancia de ListManager y obtener la lista resultante
    ListJoiner manager = ListJoiner(list1, list2);
    List<int> listasuma = manager.sumLists();

    return Column(
      children: [
        Text('Item: ${listasuma[0]}'),
        Text('Item: ${listasuma[1]}'),
        Text('Item: ${listasuma[2]}'),
        Text('Item: ${listasuma[3]}'),
      ]

    );
  }
}

