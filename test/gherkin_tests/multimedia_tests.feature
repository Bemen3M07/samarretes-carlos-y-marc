Feature: Funcionalidades de la aplicación multimedia

  Background:
    Given la aplicación está abierta

  # 📷 Funcionalidades de la Cámara
  Scenario: Tomar una foto
    Given la cámara está activa
    When el usuario pulsa el botón de captura
    Then la foto se guarda en la galería

  Scenario: Cambiar entre cámaras
    Given la cámara está activa
    When el usuario pulsa el botón de cambio de cámara
    Then la cámara cambia de frontal a trasera o viceversa

  Scenario: Activar flash y tomar foto
    Given la cámara está activa
    When el usuario activa el flash y toma una foto
    Then la foto se guarda con flash activado

  # 🖼️ Funcionalidades de la Galería
  Scenario: Abrir la galería de imágenes
    Given el usuario está en la pantalla de inicio
    When el usuario accede a la galería
    Then se muestran las imágenes almacenadas

  Scenario: Seleccionar una imagen
    Given el usuario está en la galería
    When selecciona una imagen
    Then la imagen se muestra en pantalla completa

  Scenario: Intentar abrir galería vacía
    Given la galería no tiene imágenes
    When el usuario intenta acceder
    Then se muestra un mensaje de "No hay imágenes disponibles"

  # 🎵 Funcionalidades del Reproductor de Audio
  Scenario: Reproducir una canción
    Given el usuario está en la pantalla del reproductor de audio
    When pulsa el botón de "Play"
    Then la canción empieza a reproducirse

  Scenario: Pausar la reproducción
    Given una canción está reproduciéndose
    When el usuario pulsa "Pause"
    Then la canción se detiene

  Scenario: Cambiar de canción
    Given una canción está en reproducción
    When el usuario pulsa "Siguiente"
    Then la siguiente canción de la playlist comienza a sonar

  Scenario: Activar modo aleatorio
    Given el usuario está en la pantalla del reproductor
    When pulsa el botón de aleatorio
    Then las canciones se reproducen en orden aleatorio

  Scenario: Activar repetición
    Given una canción está en reproducción
    When el usuario activa el modo "Loop"
    Then la misma canción se repite al terminar

  # 📹 Funcionalidades del Reproductor de Video
  Scenario: Reproducir un video
    Given el usuario está en la pantalla del reproductor de video
    When pulsa "Play"
    Then el video comienza a reproducirse

  Scenario: Pausar un video
    Given un video está en reproducción
    When el usuario pulsa "Pause"
    Then el video se detiene

  Scenario: Adelantar video 10 segundos
    Given un video está en reproducción
    When el usuario pulsa el botón "Adelantar 10s"
    Then el video avanza 10 segundos

  Scenario: Retroceder video 10 segundos
    Given un video está en reproducción
    When el usuario pulsa el botón "Retroceder 10s"
    Then el video retrocede 10 segundos

  Scenario: Cambiar velocidad de reproducción
    Given el usuario está viendo un video
    When selecciona una velocidad de "2x"
    Then el video se reproduce al doble de velocidad

  # 🎼 Interacción con archivos multimedia
  Scenario: Agregar una canción desde el almacenamiento
    Given el usuario está en el reproductor de audio
    When selecciona un archivo MP3 de su dispositivo
    Then la canción se añade a la playlist y se puede reproducir

  Scenario: Intentar reproducir un archivo no válido
    Given el usuario intenta abrir un archivo no compatible
    When selecciona un archivo que no es audio ni video
    Then se muestra un mensaje de error
