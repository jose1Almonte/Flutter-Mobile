# Widgets App

Aplicación demo desarrollada en **Flutter 3.11+** que explora y documenta los widgets principales de Flutter, integrando patrones modernos como **Material 3**, **Riverpod**, **GoRouter** y animaciones avanzadas.

## Captura rápida

- 11 pantallas con ejemplos prácticos de widgets Flutter
- Navegación con GoRouter y menú lateral dinámico
- Cambio de tema en tiempo real (9 colores + modo oscuro)
- Riverpod como gestor de estado
- Diseño responsivo y componentes reutilizables

## Stack tecnológico

| Tecnología | Versión | Propósito |
|---|---|---|
| Flutter | SDK ^3.11.0 | Framework principal |
| Dart | ^3.11.0 | Lenguaje |
| flutter_riverpod | ^3.3.2 | Manejo de estado |
| go_router | ^17.3.0 | Enrutamiento declarativo |
| animate_do | ^5.1.0 | Animaciones predefinidas |
| flutter_lints | ^6.0.0 | Reglas de linting |

## Estructura del proyecto

```
widgets_app/
├── lib/
│   ├── main.dart                          # Punto de entrada
│   ├── config/
│   │   ├── menu/
│   │   │   └── menu_item.dart             # Definición de ítems del menú
│   │   ├── router/
│   │   │   └── app_router.dart            # Configuración de rutas (GoRouter)
│   │   └── theme/
│   │       └── app_theme.dart             # Tema: colores, modo oscuro, Material 3
│   └── presentation/
│       ├── provider/
│       │   ├── counter_provider.dart       # StateProvider del contador
│       │   └── theme_provider.dart         # StateNotifier del tema
│       ├── screens/
│       │   ├── screens.dart               # Barrel export
│       │   ├── home/
│       │   │   └── home_screen.dart        # Pantalla principal
│       │   ├── counter/
│       │   │   └── counter_screen.dart     # Contador con Riverpod
│       │   ├── buttons/
│       │   │   └── buttons_screen.dart     # Todos los tipos de botones
│       │   ├── cards/
│       │   │   └── cards_screen.dart       # Tarjetas y elevaciones
│       │   ├── progress/
│       │   │   └── progress_screen.dart    # Indicadores de progreso
│       │   ├── snackbar/
│       │   │   └── snackbar_screen.dart    # Snackbars y diálogos
│       │   ├── animated/
│       │   │   └── animated_screen.dart    # AnimatedContainer interactivo
│       │   ├── ui_controls/
│       │   │   └── ui_controls_screen.dart # Switches, radios, checkboxes
│       │   ├── app_tutorial/
│       │   │   └── app_tutorial_screen.dart# Onboarding con PageView
│       │   ├── infinite_scroll/
│       │   │   └── infinite_scroll_screen.dart # Scroll infinito + pull-to-refresh
│       │   └── theme_changer/
│       │       └── theme_changer_screen.dart   # Selector de tema
│       └── widgets/
│           └── side_menu.dart             # NavigationDrawer reutilizable
├── assets/
│   └── images/
│       ├── 1.png                          # Tutorial slide 1
│       ├── 2.png                          # Tutorial slide 2
│       ├── 3.png                          # Tutorial slide 3
│       └── jar-loading.gif                # Loading placeholder
├── pubspec.yaml
├── pubspec.lock
└── analysis_options.yaml
```

## Pantallas

| Ruta | Pantalla | Descripción |
|---|---|---|
| `/` | Home | Menú principal con lista de navegación |
| `/counter` | Counter | Contador con Riverpod + toggle de modo oscuro |
| `/buttons` | Buttons | Catálogo de botones Material 3 |
| `/cards` | Cards | Tarjetas con distintos niveles de elevación |
| `/progress` | Progress | CircularProgress y LinearProgress con StreamBuilder |
| `/snackbars` | Snackbar | Snackbars personalizados y AlertDialog |
| `/animated` | Animated | AnimatedContainer con easing elástico |
| `/ui_controls` | UI Controls | SwitchListTile, RadioListTile, CheckboxListTile |
| `/tutorial` | Tutorial | Onboarding con PageView y animate_do |
| `/infinite` | Infinite Scroll | Scroll infinito + pull-to-refresh + FadeInImage |
| `/theme-changer` | Theme Changer | Selector de color primario y modo oscuro |

## Estado

El estado se gestiona con **Riverpod** mediante tres providers principales:

- **counterProvider** (`StateProvider<int>`) — estado simple del contador
- **themeNotifierProvider** (`StateNotifierProvider<ThemeNotifier, AppTheme>`) — estado del tema con soporte para:
  - Cambio de color primario (9 colores disponibles)
  - Alternar modo oscuro / claro

## Tema

- **Material 3** habilitado globalmente
- Esquema de color generado dinámicamente a partir de `colorSchemeSeed`
- 9 colores disponibles: blue, teal, green, red, orange, purple, deepPurple, pink, pinkAccent
- Modo oscuro conmutado desde el CounterScreen o ThemeChangerScreen
- `AppBarTheme` con títulos alineados a la izquierda

## Enrutamiento

Se utiliza **GoRouter** con rutas nombradas y navegación mediante `context.push()`. No hay rutas anidadas ni protectores de ruta. El enrutador se inyecta en `MaterialApp.router`.

## Animaciones

- **animate_do** para animaciones de entrada (`FadeInRight`, `SpinPerfect`)
- **AnimatedContainer** con `Curves.elasticOut` para animaciones implícitas
- **PageView** para el onboarding deslizable
- **FadeInImage** con GIF placeholder para carga diferida de imágenes

## Assets

- 3 imágenes PNG para las slides del tutorial (onboarding)
- 1 GIF animado (`jar-loading.gif`) usado como placeholder en el scroll infinito

## Cómo ejecutar el proyecto

### Requisitos

- Flutter SDK ^3.11.0 instalado
- Dart incluido con Flutter
- Dispositivo físico o emulador configurado (Android / iOS)
- Opcional: Chrome para web, VS Code con extensión Flutter, Android Studio o IntelliJ

### Verificar instalación

```bash
flutter --version
flutter doctor
```

`flutter doctor` revisará que todo esté correcto y te mostrará si falta algo.

### Instalar dependencias

```bash
cd widgets_app
flutter pub get
```

### Ejecutar en modo debug

Selecciona el dispositivo destino:

```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en el dispositivo predeterminado
flutter run

# O especificar un dispositivo
flutter run -d chrome            # Web
flutter run -d emulator-5554     # Android emulator
flutter run -d ios               # iOS simulator
flutter run -d <device-id>       # Por ID
```

Hot reload / hot restart:
- Durante la ejecución, presiona `r` para hot reload o `R` para hot restart en la terminal
- En VS Code, guarda el archivo (hot reload automático)

### Ejecutar en modo release

```bash
flutter run --release
```

### Build para producción

```bash
flutter build apk                # Android APK
flutter build appbundle          # Android AppBundle (Play Store)
flutter build ios                # iOS (requiere macOS)
flutter build web                # Web (HTML + JS)
flutter build windows            # Windows desktop
flutter build macos              # macOS (requiere macOS)
flutter build linux              # Linux
```

### Ejecutar análisis de código

```bash
flutter analyze
```

### Probar en múltiples plataformas sin cambiar de código

Al ser Flutter, el mismo códigobase funciona en Android, iOS, Web, Windows, macOS y Linux. Solo cambia el comando de build según la plataforma deseada.

## Licencia

Este proyecto es de uso educativo y demostrativo.
