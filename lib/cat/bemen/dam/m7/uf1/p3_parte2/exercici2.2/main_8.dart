import 'package:flutter/material.dart';

void main() {
  runApp(MainApp8());  // Ejecuta la aplicación con el widget MyApp.
}

class MainApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Desactiva la etiqueta de "Modo de depuración".
      home: GreetingPage(),  // Establece la página de inicio como GreetingPage.
    );
  }
}

class GreetingPage extends StatefulWidget {
  @override
  _GreetingPageState createState() => _GreetingPageState();  // Crea el estado asociado a GreetingPage.
}

class _GreetingPageState extends State<GreetingPage> {
  final TextEditingController _nameController = TextEditingController();  // Controlador para el campo de texto.
  String _greetingMessage = "";  // Variable que almacenará el mensaje de saludo.

  // Función para actualizar el mensaje de saludo con el nombre ingresado.
  void _updateGreeting() {
    setState(() {
      _greetingMessage = "Hello, ${_nameController.text}!";  // Crea un mensaje con el nombre del usuario.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Say Hello'),  // Título de la barra superior.
      ),
      body: Center(
        child: Column(  // Dispone los widgets de manera vertical.
          mainAxisAlignment: MainAxisAlignment.center,  // Centra los elementos dentro de la columna.
          children: [
            TextField(
              controller: _nameController,  // Asocia el controlador con el TextField.
              decoration: InputDecoration(
                labelText: 'Name',  // Etiqueta que aparece en el campo de texto.
              ),
            ),
            SizedBox(height: 20),  // Espaciado entre los widgets.
            ElevatedButton(
              onPressed: _updateGreeting,  // Llama a la función _updateGreeting al presionar el botón.
              child: Text('Say Hello'),  // Texto del botón.
            ),
            SizedBox(height: 20),  // Espaciado entre los widgets.
            Text(
              _greetingMessage,  // Muestra el mensaje de saludo actualizado.
              style: TextStyle(fontSize: 24),  // Estilo del texto.
            ),
          ],
        ),
      ),
    );
  }
}
