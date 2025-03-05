import 'package:cucumber/cucumber.dart';
import 't_shirt_calculator_logic.dart';

class StepDefinitions {
  // Variables necesarias para las pruebas
  int numeroCamisetas = 0;
  String talla = '';
  String oferta = '';
  double precioTotal = 0.0;

  // Step de Gherkin - "Given el usuario introduce 'X' como número de camisetas"
  @Given(r'el usuario introduce "([^"]*)" como número de camisetas')
  void givenNumeroCamisetas(String numero) {
    numeroCamisetas = int.parse(numero);
  }

  // Step de Gherkin - "Given selecciona 'X' como talla"
  @Given(r'selecciona "([^"]*)" como talla')
  void givenSeleccionaTalla(String tallaSeleccionada) {
    talla = tallaSeleccionada;
  }

  // Step de Gherkin - "Given selecciona 'X' como oferta"
  @Given(r'selecciona "([^"]*)" como oferta')
  void givenSeleccionaOferta(String ofertaSeleccionada) {
    oferta = ofertaSeleccionada;
  }

  // Step de Gherkin - "When el sistema calcula el precio"
  @When(r'el sistema calcula el precio')
  void whenCalculaPrecio() {
    precioTotal = TShirtCalculatorLogic.preuDefinitiu(numeroCamisetas, talla, oferta);
  }

  // Step de Gherkin - "Then el precio total debe ser 'X'"
  @Then(r'el precio total debe ser "([^"]*)"')
  void thenElPrecioTotal(String precioEsperado) {
    double precio = double.parse(precioEsperado.replaceAll(' €', '').replaceAll(',', '.'));
    assert(precioTotal == precio);
  }
}
void main() {
  final stepDefinitions = StepDefinitions();

  group('Pruebas Funcionales de la Calculadora de Samarretes', () {
    // Ejecutamos las pruebas usando Cucumber
    Cucumber.run([stepDefinitions]);
  });
}
