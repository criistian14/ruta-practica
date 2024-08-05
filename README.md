# Fake Store Client

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Bienvenido a **Fake Store Client**, una aplicación en Dart que consulta datos de la siguiente API [Fake Store Api](https://fakestoreapi.com/).
---

## Funcionalidades

- **Consultar lista de categorias** 
- **Consultar lista de productos en base a una categoria**
- **Consultar detalle de un producto por id**

---

## Estructura de carpetas

Se decidio usar **clean architecture** para el desarrollo de esta aplicación ya que facilita los test y el orden en el codigo separando responsabilidades.


---

## Librerías Utilizadas

Esta aplicación utiliza una variedad de librerías para mejorar su funcionalidad y desarrollo. A continuación, se describen las librerías y su propósito:

### Dependencias

- **dartz**: Control de errores.
- **dio**: Una potente librería de HTTP cliente para Dart, utilizada para realizar solicitudes a la API.
- **talker**: Visualizar de manera facil los mensajes mostrados en consola.

---

## Instalación y Configuración

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/criistian14/ruta-practica
   cd ruta-practica
   ```

2. **Instalar dependencias**:
   ```bash
   flutter pub get
   ```
3. **Ejecutar la aplicación**:
   ```bash
   dart run 
   ```
---

[coverage_badge]: coverage_badge.svg
[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
