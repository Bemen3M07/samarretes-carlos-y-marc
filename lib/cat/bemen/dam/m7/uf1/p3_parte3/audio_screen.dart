// ==============================
//   IMPORTACIÓN DE PAQUETES
// ==============================
// Importamos los paquetes necesarios para el reproductor de audio, selección de archivos y manejo de archivos.
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

// ==============================
//   CLASE PRINCIPAL MP3PlayerScreen
// ==============================
// Pantalla principal del reproductor de MP3.
class MP3PlayerScreen extends StatefulWidget {
  @override
  _MP3PlayerScreenState createState() => _MP3PlayerScreenState();
}

class _MP3PlayerScreenState extends State<MP3PlayerScreen> {
  // Instancia del reproductor de audio.
  late AudioPlayer _audioPlayer;

  // Lista de reproducción inicial con archivos de audio en assets.
  List<String> playlist = [
    'assets/audioPrueba1.mp3',
    'assets/audioPrueba2.mp3',
    'assets/audioPrueba3.mp3'
  ];

  // Variables para controlar la reproducción.
  int _currentTrackIndex = 0; // Índice de la canción actual.
  bool _isPlaying = false; // Estado de reproducción.
  bool _isLooping = false; // Indica si la reproducción está en bucle.
  bool _isShuffling = false; // Indica si la reproducción está en modo aleatorio.

  // Duraciones de la canción actual.
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // ==============================
  //   MÉTODO INITSTATE (INICIALIZACIÓN)
  // ==============================
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Listener para actualizar la posición de la canción mientras se reproduce.
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() => _currentPosition = position);
    });

    // Listener para obtener la duración total de la canción.
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _totalDuration = duration);
    });

    // Listener para detectar cuando una canción termina y reproducir la siguiente.
    _audioPlayer.onPlayerComplete.listen((_) {
      _playNextTrack();
    });
  }

  // ==============================
  //   MÉTODO PARA REPRODUCIR / PAUSAR
  // ==============================
  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause(); // Pausar si ya está reproduciendo.
    } else {
      await _audioPlayer.play(AssetSource(playlist[_currentTrackIndex])); // Reproducir la canción actual.
    }
    setState(() => _isPlaying = !_isPlaying); // Cambiar estado de reproducción.
  }

  // ==============================
  //   MÉTODO PARA REPRODUCIR SIGUIENTE CANCIÓN
  // ==============================
  void _playNextTrack() {
    setState(() {
      if (_isShuffling) {
        // Si está en modo aleatorio, elige una canción al azar.
        _currentTrackIndex = (DateTime.now().millisecondsSinceEpoch % playlist.length);
      } else {
        // Si no, avanza a la siguiente canción.
        _currentTrackIndex = (_currentTrackIndex + 1) % playlist.length;
      }
    });
    _audioPlayer.play(AssetSource(playlist[_currentTrackIndex])); // Reproduce la nueva canción.
  }

  // ==============================
  //   MÉTODO PARA AÑADIR ARCHIVO DE AUDIO
  // ==============================
  void _addAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      setState(() {
        playlist.add(result.files.single.path!); // Añadir el archivo a la playlist.
      });
    }
  }

  // ==============================
  //   MÉTODO PARA ACTIVAR/DESACTIVAR LOOP
  // ==============================
  void _toggleLoop() {
    setState(() => _isLooping = !_isLooping);
    _audioPlayer.setReleaseMode(
      _isLooping ? ReleaseMode.loop : ReleaseMode.release
    );
  }

  // ==============================
  //   MÉTODO PARA ACTIVAR/DESACTIVAR SHUFFLE
  // ==============================
  void _toggleShuffle() {
    setState(() => _isShuffling = !_isShuffling);
  }

  // ==============================
  //   MÉTODO PARA SALTAR A UNA POSICIÓN DE LA CANCIÓN
  // ==============================
  void _seekAudio(double value) {
    _audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  // ==============================
  //   MÉTODO PARA LIBERAR RECURSOS
  // ==============================
  @override
  void dispose() {
    _audioPlayer.dispose(); // Libera la memoria utilizada por el reproductor.
    super.dispose();
  }

  // ==============================
  //   INTERFAZ DE USUARIO
  // ==============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reproductor MP3')), // Título en la barra superior.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Muestra el nombre del archivo que se está reproduciendo.
          Text('Reproduciendo: ${playlist[_currentTrackIndex].split('/').last}'),

          // Barra deslizante para indicar la posición en la canción.
          Slider(
            value: _currentPosition.inSeconds.toDouble(),
            min: 0.0,
            max: _totalDuration.inSeconds.toDouble(),
            onChanged: _seekAudio, // Permite cambiar la posición de la canción.
          ),

          // Controles de reproducción (anterior, play/pausa, siguiente).
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.skip_previous), onPressed: _playNextTrack),
              IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow), 
                onPressed: _playPause, iconSize: 60.0),
              IconButton(icon: Icon(Icons.skip_next), onPressed: _playNextTrack),
            ],
          ),

          // Botones para activar/desactivar shuffle y loop.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.shuffle, color: _isShuffling ? Colors.blue : Colors.black),
                onPressed: _toggleShuffle,
              ),
              IconButton(
                icon: Icon(Icons.loop, color: _isLooping ? Colors.blue : Colors.black),
                onPressed: _toggleLoop,
              ),
            ],
          ),

          // Botón para añadir un nuevo archivo MP3.
          ElevatedButton(onPressed: _addAudioFile, child: Text('Añadir MP3')),
        ],
      ),
    );
  }
}
