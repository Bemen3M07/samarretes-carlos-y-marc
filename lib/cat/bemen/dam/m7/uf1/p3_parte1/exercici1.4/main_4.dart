// Importamos el paquete Flutter Material para utilizar los widgets y herramientas de diseño.
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp4());
}
  
// Definimos una clase Contact que representa un contacto con nombre completo, email y teléfono.
class Contact {
  final String fullName;
  final String email;
  final String phone;

  // Constructor de la clase Contact. Todos los campos son requeridos.
  const Contact({
    required this.fullName,
    required this.email,
    required this.phone,
  });
}

// Definimos la clase MainApp que extiende StatelessWidget porque no tiene estado mutable.
class MainApp4 extends StatelessWidget {
  const MainApp4({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos una instancia de Contact con valores específicos.
    final contact = Contact(
      fullName: 'Marta Casserres',
      email: 'marta@example.com',
      phone: '934578484',
    );

    // MaterialApp es el widget raíz que permite configurar temas, rutas y otras propiedades.
    return MaterialApp(
      home: Scaffold(
        // Establecemos el color de fondo de la pantalla en blanco.
        backgroundColor: Colors.white,
        body: Center(
          // Usamos un Column para organizar los widgets en una disposición vertical.
          child: Column(
            children: [
              // Imagen circular con ClipRRect que recorta la imagen en forma de círculo.
              ClipRRect(
                borderRadius: BorderRadius.circular(50), // Ajusta el radio para hacer la imagen circular.
                child: Image.network(
                  'assets/main313.png', // Asegúrate de usar una URL válida o un archivo de imagen local.
                  width: 100, // Ancho de la imagen.
                  height: 100, // Alto de la imagen.
                  fit: BoxFit.cover, // Ajusta la imagen para cubrir el área disponible sin distorsionar.
                ),
              ),
              // Espaciador entre la imagen y el siguiente widget.
              const SizedBox(height: 16),
              // Muestra el nombre completo del contacto en un tamaño grande y en negrita.
              Text(
                contact.fullName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Espaciador entre el nombre y el siguiente widget.
              const SizedBox(height: 16),
              // Caja de información del contacto con bordes redondeados y fondo gris claro.
              Container(
                padding: const EdgeInsets.all(16), // Relleno interno del contenedor.
                margin: const EdgeInsets.symmetric(horizontal: 32), // Márgenes horizontales.
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo gris claro.
                  borderRadius: BorderRadius.circular(8), // Bordes redondeados.
                ),
                // Usamos una columna para organizar los detalles dentro del contenedor.
                child: Column(
                  children: [
                    // Fila que contiene el ícono de email y el texto del email del contacto.
                    Row(
                      children: [
                        const Icon(Icons.email, color: Colors.black54), // Ícono de correo.
                        const SizedBox(width: 8), // Espaciado entre el ícono y el texto.
                        Text(
                          contact.email,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87, // Color oscuro para el texto.
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12), // Espaciador entre la primera y la segunda fila.
                    // Fila que contiene el ícono de teléfono y el número de teléfono del contacto.
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.black54), // Ícono de teléfono.
                        const SizedBox(width: 8), // Espaciado entre el ícono y el texto.
                        Text(
                          contact.phone,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87, // Color oscuro para el texto.
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
