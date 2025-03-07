// ==================================
//   IMPORTACIÓN DE PAQUETES
// ==================================
// Importamos los paquetes necesarios para la interfaz de usuario y la reproducción de video.
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ==================================
//   CLASE PRINCIPAL VideoPlayerScreen
// ==================================
// Pantalla que gestiona la reproducción de videos.
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // Controlador para la reproducción de video.
  late VideoPlayerController _controller;
  
  // Estado de reproducción del video.
  bool _isPlaying = false;

  // Posición actual del video (en segundos).
  double _currentPosition = 0.0;
  
  // Velocidad actual de reproducción.
  double _speed = 1.0; 

  // ==================================
  //   MÉTODO INITSTATE (INICIALIZACIÓN)
  // ==================================
  @override
  void initState() {
    super.initState();
    _initializePlayer(); // Inicializa el reproductor de video.
  }

  // ==================================
  //   MÉTODO PARA INICIALIZAR EL REPRODUCTOR
  // ==================================
  Future<void> _initializePlayer() async {
    _controller = VideoPlayerController.asset('assets/videoPrueba.mp4') // También puedes usar una URL
      ..initialize().then((_) {
        setState(() {}); // Actualiza la UI una vez que el video está listo.
      });
  }

  // ==================================
  //   MÉTODO PARA REPRODUCIR O PAUSAR EL VIDEO
  // ==================================
  void _playPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause(); // Pausa el video si está reproduciendo.
      } else {
        _controller.play(); // Reproduce el video si está pausado.
      }
      _isPlaying = !_isPlaying; // Alterna el estado de reproducción.
    });
  }

  // ==================================
  //   MÉTODO PARA ADELANTAR EL VIDEO 10 SEGUNDOS
  // ==================================
  void _seekForward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition + Duration(seconds: 10); // Adelanta 10 segundos.
    _controller.seekTo(newPosition);
  }

  // ==================================
  //   MÉTODO PARA RETROCEDER EL VIDEO 10 SEGUNDOS
  // ==================================
  void _seekBackward() {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition - Duration(seconds: 10); // Retrocede 10 segundos.
    _controller.seekTo(newPosition);
  }

  // ==================================
  //   MÉTODO PARA CAMBIAR LA VELOCIDAD DE REPRODUCCIÓN
  // ==================================
  void _changeSpeed(double speed) {
    setState(() {
      _speed = speed; // Asigna la nueva velocidad.
      _controller.setPlaybackSpeed(_speed); // Aplica la velocidad al reproductor.
    });
  }

  // ==================================
  //   MÉTODO PARA LIBERAR RECURSOS
  // ==================================
  @override
  void dispose() {
    _controller.dispose(); // Libera la memoria utilizada por el reproductor de video.
    super.dispose();
  }

  // ==================================
  //   INTERFAZ DE USUARIO
  // ==================================
  @override
  Widget build(BuildContext context) {
    // Si el video aún no está inicializado, muestra un indicador de carga.
    if (!_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Reproductor de Video'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Muestra el video con el tamaño ajustado a su relación de aspecto.
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          
          // Controles de reproducción: retroceder, play/pausa y adelantar.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10),
                onPressed: _seekBackward,
                iconSize: 60.0,
              ),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: _playPause,
                iconSize: 60.0,
              ),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: _seekForward,
                iconSize: 60.0,
              ),
            ],
          ),

          // Botones para cambiar la velocidad de reproducción.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _changeSpeed(0.5), // Velocidad 0.5x (lenta).
                child: Text('0.5x'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _changeSpeed(1.0), // Velocidad normal 1x.
                child: Text('1x'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _changeSpeed(2.0), // Velocidad 2x (rápida).
                child: Text('2x'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
