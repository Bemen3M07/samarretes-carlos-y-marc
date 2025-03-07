// main.dart

// ==============================
//   IMPORTACIÓN DE PAQUETES
// ==============================
// Se importan los paquetes necesarios y las pantallas que se usarán en la aplicación.
import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'gallery_screen.dart';
import 'audio_screen.dart';
import 'video_screen.dart';

// ==============================
//   FUNCIÓN PRINCIPAL
// ==============================
// Punto de entrada de la aplicación, ejecuta MyApp.
void main() {
  runApp(MyApp());
}

// ==============================
//   CLASE PRINCIPAL MyApp
// ==============================
// Representa la aplicación y configura las rutas de navegación.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Multimedia', // Título de la aplicación
      initialRoute: '/', // Ruta inicial al iniciar la app
      routes: {
        // Definición de rutas para la navegación entre pantallas
        '/': (context) => HomeScreen(),
        '/camera': (context) => CameraScreen(),
        '/audio': (context) => MP3PlayerScreen(),
        '/video': (context) => VideoPlayerScreen(),
        '/gallery': (context) => GalleryScreen(),
      },
    );
  }
}

// ==============================
//   PANTALLA PRINCIPAL (HOME)
// ==============================
// HomeScreen es un StatefulWidget ya que su estado cambiará con la navegación.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Índice de la pestaña seleccionada en la barra de navegación.
  int _selectedIndex = 0;
  
  // Lista de pantallas disponibles en la navegación inferior.
  final List<Widget> _pages = [
    CameraScreen(), // Pantalla de la cámara
    MP3PlayerScreen(), // Pantalla del reproductor de audio
    VideoPlayerScreen(), // Pantalla del reproductor de video
    GalleryScreen(), // Pantalla de la galería de imágenes
  ];

  // ==============================
  //   MÉTODO PARA CAMBIAR DE PESTAÑA
  // ==============================
  // Actualiza el estado de la pantalla activa cuando el usuario cambia de pestaña.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ==============================
  //   CONSTRUCCIÓN DE LA INTERFAZ
  // ==============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de navegación superior con título
      appBar: AppBar(title: Text('Home')),
      
      // Cuerpo de la aplicación que muestra la pantalla seleccionada.
      body: _pages[_selectedIndex],
      
      // Barra de navegación inferior con cuatro opciones.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Icono y etiqueta de cada pestaña
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Cámara'),
          BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: 'Audio'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Galería'),
        ],
        currentIndex: _selectedIndex, // Indica qué pestaña está seleccionada
        selectedItemColor: Colors.blue, // Color del icono seleccionado
        backgroundColor: Colors.black, // Color de fondo de la barra de navegación
        onTap: _onItemTapped, // Llama al método para cambiar la pantalla activa
      ),
    );
  }
}
