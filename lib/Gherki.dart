import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Cámara y reproductor de música', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Tomar una foto con la cámara frontal', () async {
      // Given que estoy en la pantalla de la cámara
      await driver.tap(find.byValueKey('camera_button'));

      // When selecciono la cámara frontal
      await driver.tap(find.byValueKey('front_camera_button'));

      // Y hago una foto
      await driver.tap(find.byValueKey('take_photo_button'));

      // Then la foto debe guardarse en la galería
      expect(await driver.getText(find.byValueKey('photo_saved_message')), 'Foto guardada');
    });

    test('Reproducir música desde un archivo cargado', () async {
      // Given que he subido un archivo de música
      await driver.tap(find.byValueKey('upload_music_button'));

      // When hago clic en "Reproducir"
      await driver.tap(find.byValueKey('play_button'));

      // Then la música debe empezar a sonar
      expect(await driver.getText(find.byValueKey('music_playing_message')), 'Música sonando');
    });

    // Aquí agregas más pruebas para otros escenarios
  });
}
