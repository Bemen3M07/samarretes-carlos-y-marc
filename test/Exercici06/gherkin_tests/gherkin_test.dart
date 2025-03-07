import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:samarretes/cat/bemen/dam/m7/uf1/p3_parte3/main.dart' as app;
import 'package:flutter/material.dart';

Future<void> main() async {
  final config = FlutterTestConfiguration()
    ..features = ["test/gherkin_tests/*.feature"]
    ..stepDefinitions = [
      givenTheAppIsRunning(),
      whenTheUserTapsCameraButton(),
      thenVerifyGalleryOpens(),
      whenTheUserPlaysAudio(),
      thenVerifyAudioIsPlaying(),
      whenTheUserPlaysVideo(),
      thenVerifyVideoIsPlaying(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "lib/main.dart"; // Asegúrate de que la ruta sea correcta

  return GherkinRunner().execute(config);
}

// ==================================
//  GIVEN: La aplicación está abierta
// ==================================
StepDefinitionGeneric givenTheAppIsRunning() {
  return given<FlutterWorld>(
    'la aplicación está abierta',
    (context) async {
      final tester = context.world.appDriver! as WidgetTester;
      await tester.pumpWidget(app.MyApp()); 
      await tester.pumpAndSettle(); 
    },
  );
}

// ==================================
//  WHEN: El usuario pulsa el botón de la cámara
// ==================================
StepDefinitionGeneric whenTheUserTapsCameraButton() {
  return when<FlutterWorld>(
    'el usuario pulsa el botón de captura',
    (context) async {
      final tester = context.world.appDriver! as WidgetTester;
      final buttonFinder = find.byKey(Key('cameraButton'));
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
    },
  );
}

// ==================================
//  THEN: Se abre la galería
// ==================================
StepDefinitionGeneric thenVerifyGalleryOpens() {
  return then<FlutterWorld>(
    'la foto se guarda en la galería',
    (context) async {
      final tester = context.world.appDriver! as WidgetTester;
      expect(find.text('Galería'), findsOneWidget);
    },
  );
}

// ==================================
//  WHEN: El usuario reproduce una canción
// ==================================
StepDefinitionGeneric whenTheUserPlaysAudio() {
  return when<FlutterWorld>(
    'el usuario reproduce una canción',
    (context) async {
      final tester = context.world.appDriver! as WidgetTester;
      final playButtonFinder = find.byIcon(Icons.play_arrow);
      await tester.tap(playButtonFinder);
      await tester.pumpAndSettle();
    },
  );
}

// ==================================
//  THEN: El audio empieza a reproducirse
// ==================================
StepDefinitionGeneric thenVerifyVideoIsPlaying() {
  return then<FlutterWorld>(
    'el video comienza a reproducirse',
    (context) async {
      final driver = context.world.appDriver!; // Usar el driver correctamente
      await driver.waitForAppToSettle();
      expect(find.byIcon(Icons.pause), findsOneWidget);
    },
  );
}


// ==================================
//  WHEN: El usuario reproduce un video
// ==================================
StepDefinitionGeneric whenTheUserPlaysVideo() {
  return when<FlutterWorld>(
    'el usuario reproduce un video',
    (context) async {
      final tester = context.world.appDriver! as WidgetTester;
      final playButtonFinder = find.byIcon(Icons.play_arrow);
      await tester.tap(playButtonFinder);
      await tester.pumpAndSettle();
    },
  );
}

// ==================================
//  THEN: El video comienza a reproducirse
// ==================================
StepDefinitionGeneric thenVerifyVideoIsPlaying() {
  return then<FlutterWorld>(
    'el video comienza a reproducirse',
    (context) async {
      final tester = context.world.appDriver! as WidgetTester;
      expect(find.byIcon(Icons.pause), findsOneWidget);
    },
  );
}
