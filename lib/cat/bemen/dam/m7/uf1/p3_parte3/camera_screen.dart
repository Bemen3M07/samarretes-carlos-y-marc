// ==================================
//   IMPORTACIÓN DE PAQUETES
// ==================================
// Importamos los paquetes necesarios para la cámara y la interfaz de usuario.
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// ==================================
//   CLASE PRINCIPAL CameraScreen
// ==================================
// Pantalla que gestiona la funcionalidad de la cámara.
class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // Controlador de la cámara.
  late CameraController _controller;
  
  // Lista de cámaras disponibles en el dispositivo.
  late List<CameraDescription> _cameras;

  // Variable para determinar si se usa la cámara trasera.
  bool _isRearCamera = true;

  // ==================================
  //   MÉTODO INITSTATE (INICIALIZACIÓN)
  // ==================================
  @override
  void initState() {
    super.initState();
    _initializeCamera(); // Inicializa la cámara al cargar la pantalla.
  }

  // ==================================
  //   MÉTODO PARA INICIALIZAR LA CÁMARA
  // ==================================
  Future<void> _initializeCamera() async {
    _cameras = await availableCameras(); // Obtiene la lista de cámaras disponibles.
    _setCamera(_isRearCamera ? 0 : 1); // Configura la cámara inicial (trasera o frontal).
  }

  // ==================================
  //   MÉTODO PARA CONFIGURAR UNA CÁMARA ESPECÍFICA
  // ==================================
  void _setCamera(int index) async {
    _controller = CameraController(_cameras[index], ResolutionPreset.high); // Configura la cámara con alta resolución.
    await _controller.initialize(); // Inicializa el controlador de la cámara.
    
    if (!mounted) return; // Verifica si el widget sigue montado para evitar errores.

    setState(() {}); // Actualiza la UI tras la inicialización.
  }

  // ==================================
  //   MÉTODO PARA CAMBIAR ENTRE CÁMARAS
  // ==================================
  void _switchCamera() {
    setState(() {
      _isRearCamera = !_isRearCamera; // Alterna entre cámara trasera y frontal.
      _setCamera(_isRearCamera ? 0 : 1); // Asigna la cámara correspondiente.
    });
  }

  // ==================================
  //   MÉTODO PARA TOMAR UNA FOTO
  // ==================================
  Future<void> _takePicture() async {
    try {
      await _controller.setFlashMode(FlashMode.torch); // Activa el flash antes de tomar la foto.
      final XFile file = await _controller.takePicture(); // Captura la imagen.
      print('Foto tomada: ${file.path}'); // Muestra la ruta de la imagen en la consola.
      await _controller.setFlashMode(FlashMode.off); // Apaga el flash después de tomar la foto.
    } catch (e) {
      print("Error al tomar la foto: $e"); // Captura errores en la toma de la foto.
    }
  }

  // ==================================
  //   MÉTODO PARA LIBERAR RECURSOS
  // ==================================
  @override
  void dispose() {
    _controller.dispose(); // Libera la memoria utilizada por el controlador de la cámara.
    super.dispose();
  }

  // ==================================
  //   INTERFAZ DE USUARIO
  // ==================================
  @override
  Widget build(BuildContext context) {
    // Si la cámara aún no está inicializada, muestra un indicador de carga.
    if (!_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara'),
        actions: [
          // Botón para cambiar entre la cámara trasera y la frontal.
          IconButton(icon: Icon(Icons.switch_camera), onPressed: _switchCamera)
        ],
      ),
      body: Column(
        children: [
          // Muestra la vista previa de la cámara ocupando todo el espacio disponible.
          Expanded(child: CameraPreview(_controller)),
          
          // Botón para tomar una foto.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(Icons.camera_alt, size: 50.0),
              onPressed: _takePicture,
            ),
          ),
        ],
      ),
    );
  }
}
