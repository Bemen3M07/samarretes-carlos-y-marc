// ==================================
//   IMPORTACIÓN DE PAQUETES
// ==================================
// Importamos los paquetes necesarios para la interfaz de usuario, la selección de imágenes y el manejo de archivos.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// ==================================
//   CLASE PRINCIPAL GalleryScreen
// ==================================
// Pantalla que permite seleccionar una imagen de la galería y mostrarla.
class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // Instancia de ImagePicker para seleccionar imágenes.
  final ImagePicker _picker = ImagePicker();
  
  // Variable que almacenará la imagen seleccionada.
  XFile? _image;

  // ==================================
  //   MÉTODO PARA SELECCIONAR UNA IMAGEN
  // ==================================
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery); // Abre la galería y permite seleccionar una imagen.

    setState(() {
      _image = image; // Asigna la imagen seleccionada a la variable.
    });
  }

  // ==================================
  //   INTERFAZ DE USUARIO
  // ==================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galería')), // Título de la pantalla.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Botón para abrir la galería y seleccionar una imagen.
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Seleccionar Imagen'),
          ),
          
          SizedBox(height: 20), // Espacio entre el botón y la imagen.

          // Muestra la imagen seleccionada o un mensaje si no hay imagen.
          _image == null
              ? Center(child: Text('No se ha seleccionado ninguna imagen')) // Mensaje cuando no hay imagen.
              : Image.file(File(_image!.path)), // Muestra la imagen seleccionada.
        ],
      ),
    );
  }
}
