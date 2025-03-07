import 'package:flutter/material.dart';
import 'dart:math';

// Definimos la clase Message que representa un mensaje con un autor y un cuerpo.
class Message {
  final String author; // Almacena el autor del mensaje.
  final String body;   // Almacena el cuerpo del mensaje.

  // Constructor de la clase Message que inicializa los atributos.
  Message(this.author, this.body);
}

void main() {
  runApp(MainApp5());  // Inicia la aplicación ejecutando el widget MyApp.
}

class MainApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Desactiva el banner de depuración en la app.
      home: MessageListScreen(),  // La pantalla principal donde se muestran los mensajes.
    );
  }
}

class MessageListScreen extends StatefulWidget {
  @override
  _MessageListScreenState createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final ScrollController _scrollController = ScrollController();  // Controlador para el desplazamiento de la lista.
  final List<Message> _messages = [];  // Lista que contendrá los mensajes a mostrar.
  final Random _random = Random();  // Instancia para generar números aleatorios.

  // Lista de nombres posibles para los autores de los mensajes.
  final List<String> _names = [
    "Ellison Curry", "Briggs Willis", "Alexa Murphy", "Cameron Berry", 
    "Annabelle Villarreal", "Nikolai Wiley", "Lauryn Morrow", "Kyree Hardy", 
    "Wells Wilson", "Luna Foster", "Kayden Taylor", "Sofia Mann", 
    "Nehemiah Randall", "Christina Gordon", "Karter Kramer", "Hanna Morales", 
    "Megan Delarosa", "Osiris Johnson", "Emma Atkins", "Cason McKee", 
    "Kori Walls", "Larry Shepherd",
  ];

  // Texto que se muestra en todos los cuerpos de los mensajes.
  final String _body =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";

  @override
  void initState() {
    super.initState();
    _generateMessages();  // Llama al método para generar los primeros mensajes.
    _scrollController.addListener(_scrollListener);  // Añade un escuchador para el scroll.
  }

  // Método que genera mensajes aleatorios y los agrega a la lista _messages.
  void _generateMessages() {
    setState(() {
      _messages.addAll(List.generate(20, (index) {
        return Message(
          _names[_random.nextInt(_names.length)],  // Selecciona un autor aleatorio de la lista.
          _body,  // Asigna el texto fijo como el cuerpo del mensaje.
        );
      }));
    });
  }

  // Método que se activa cuando el usuario se desplaza por la lista.
  void _scrollListener() {
    // Si el usuario ha llegado al final de la lista, genera más mensajes.
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _generateMessages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite Scroll List"),  // Título de la barra de la aplicación.
      ),
      body: ListView.builder(
        controller: _scrollController,  // Asociamos el controlador para el desplazamiento.
        itemCount: _messages.length,  // El número total de mensajes que se mostrarán.
        itemBuilder: (context, index) {
          final message = _messages[index];  // Obtenemos el mensaje en la posición indicada.
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),  // Márgenes para las tarjetas.
            child: Padding(
              padding: const EdgeInsets.all(16.0),  // Relleno dentro de la tarjeta.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // Alineamos el texto a la izquierda.
                children: [
                  // Mostramos el nombre del autor en negrita.
                  Text(
                    message.author,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,  // Negrita para el nombre.
                      fontSize: 16,  // Tamaño de la fuente para el autor.
                    ),
                  ),
                  SizedBox(height: 8),  // Espacio entre el autor y el cuerpo del mensaje.
                  // Mostramos el cuerpo del mensaje.
                  Text(
                    message.body,
                    style: TextStyle(fontSize: 14),  // Tamaño de la fuente para el cuerpo.
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Funcionalidad vacía para el botón flotante por ahora.
        child: Icon(Icons.add),  // Ícono de añadir para el botón flotante.
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();  // Liberamos el controlador cuando el widget es destruido.
    super.dispose();
  }
}
