import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver; // 'late' asegura que el driver será inicializado antes de ser usado

  // Configuración inicial antes de ejecutar todos los tests
  setUpAll(() async {
    driver = await FlutterDriver.connect(); // Conecta con la aplicación Flutter
  });

  // Limpieza después de ejecutar todos los tests
  tearDownAll(() async {
    if (driver != null) { // Si el driver está inicializado
      await driver.close(); // Cierra la conexión con la aplicación
    }
  });

  // Prueba para verificar que la cámara frontal toma una foto correctamente
  test('Tomar una foto con la cámara frontal', () async {
    // Given: Estando en la pantalla de la cámara
    await driver.tap(find.byValueKey('camera_button')); // Toca el botón de la cámara

    // When: Seleccionando la cámara frontal
    await driver.tap(find.byValueKey('front_camera_button')); // Toca el botón para la cámara frontal

    // Y: Toma una foto
    await driver.tap(find.byValueKey('take_photo_button')); // Toca el botón para tomar la foto

    // Then: Se debe mostrar un mensaje indicando que la foto ha sido guardada
    expect(await driver.getText(find.byValueKey('photo_saved_message')), 'Foto guardada'); // Verifica que el mensaje mostrado sea "Foto guardada"
  });

  // Prueba para verificar que la música se reproduce correctamente
  test('Reproducir música desde un archivo cargado', () async {
    // Given: El usuario ha subido un archivo de música
    await driver.tap(find.byValueKey('upload_music_button')); // Toca el botón para cargar música

    // When: El usuario presiona el botón de "Reproducir"
    await driver.tap(find.byValueKey('play_button')); // Toca el botón de reproducir música

    // Then: La música debe empezar a sonar
    expect(await driver.getText(find.byValueKey('music_playing_message')), 'Música sonando'); // Verifica que el mensaje mostrado sea "Música sonando"
  });

  // Aquí se puedens agregar más pruebas para otros escenarios (como la reproducción de videos o el uso de la cámara trasera)
}
