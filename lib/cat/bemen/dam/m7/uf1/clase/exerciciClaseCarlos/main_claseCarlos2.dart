import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListJoiner(),
        ),
      ),
    );
  }
}

class ListJoiner extends StatelessWidget {
  final List<int> list1 = [1, 2, 3, 4, 5];
  final List<int> list2 = [6, 7, 8, 9, 10];

  // Método para restar las listas
  List<int> subtractLists() {
    int maxLength = list1.length > list2.length ? list1.length : list2.length;
    List<int> result = List.generate(maxLength, (index) {
      int value1 = index < list1.length ? list1[index] : 0;
      int value2 = index < list2.length ? list2[index] : 0;
      return value1 - value2;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<int> list3 = subtractLists(); // Llamar al método para obtener la lista resultante

    return Column(
      children: [
        Text('Resta:'),
        Text('Item: ${list3[0]}'),
        Text('Item: ${list3[1]}'),
        Text('Item: ${list3[2]}'),
        Text('Item: ${list3[3]}'),
        Text('Item: ${list3[4]}'),
      ],
    );
  }
}
