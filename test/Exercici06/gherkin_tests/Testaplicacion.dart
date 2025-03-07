import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:samarretes/cat/bemen/dam/m7/uf1/p3_parte3/main.dart';
import 'package:samarretes/cat/bemen/dam/m7/uf1/p3_parte3/audio_screen.dart';
import 'package:samarretes/cat/bemen/dam/m7/uf1/p3_parte3/camera_screen.dart';
import 'package:samarretes/cat/bemen/dam/m7/uf1/p3_parte3/gallery_screen.dart';
import 'package:samarretes/cat/bemen/dam/m7/uf1/p3_parte3/video_screen.dart';

void main() {
  testWidgets('La aplicación muestra la pantalla de inicio correctamente', (WidgetTester tester) async {
    // Construye la aplicación y la ejecuta
    await tester.pumpWidget(MyApp());

    // Verifica que la pantalla inicial es la HomeScreen
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);

    // Verifica que la barra de navegación inferior está presente
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Navegación entre pestañas funciona correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verifica que la pantalla inicial es la de la cámara
    expect(find.byType(CameraScreen), findsOneWidget);

    // Toca el botón de "Audio"
    await tester.tap(find.byIcon(Icons.audiotrack));
    await tester.pumpAndSettle();

    // Verifica que ahora se muestra la pantalla de audio
    expect(find.byType(MP3PlayerScreen), findsOneWidget);

    // Toca el botón de "Video"
    await tester.tap(find.byIcon(Icons.video_library));
    await tester.pumpAndSettle();

    // Verifica que ahora se muestra la pantalla de video
    expect(find.byType(VideoPlayerScreen), findsOneWidget);

    // Toca el botón de "Galería"
    await tester.tap(find.byIcon(Icons.photo));
    await tester.pumpAndSettle();

    // Verifica que ahora se muestra la pantalla de la galería
    expect(find.byType(GalleryScreen), findsOneWidget);
  });

  testWidgets('Verifica que los elementos principales existen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verifica que la AppBar con título "Home" existe
    expect(find.widgetWithText(AppBar, 'Home'), findsOneWidget);

    // Verifica que la barra de navegación inferior tiene los 4 iconos
    expect(find.byIcon(Icons.camera), findsOneWidget);
    expect(find.byIcon(Icons.audiotrack), findsOneWidget);
    expect(find.byIcon(Icons.video_library), findsOneWidget);
    expect(find.byIcon(Icons.photo), findsOneWidget);
  });
}
