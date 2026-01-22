# SCUBE App - AI Agent Instructions

## Project Overview
**SCUBE** is a Flutter mobile app for IoT control and monitoring (solar/power systems). Multi-screen dashboard with login flow, real-time monitoring widgets, and navigation between data views.

- **Type**: Flutter mobile app (Android, iOS, Web, Linux, Windows)
- **SDK**: Dart 3.10.7+
- **Build**: Standard Flutter project structure
- **Purpose**: Real-time monitoring and control dashboard for energy systems

## Architecture & Navigation Flow

### Screen Hierarchy
1. **SplashScreen** → (3-sec auto-navigate)
2. **LoginScreen** (username/password, navigates to DashboardScreen)
3. **DashboardScreen** (main view, "1st Page" with notification badge)
4. **SecondPageScreen** (accessible via "2nd Page Navigate" button)

**Key Pattern**: Use `Navigator.push()` for forward navigation, `Navigator.pop()` for back. Splash uses `pushReplacement()` to clear history.

### Widget Composition
App heavily uses **stateless, reusable UI components** (InfoCard, WeatherCard, ComparisonTable, etc.). Screens import specific widgets rather than monolithic layouts.

**Widget Locations** and purposes:
- `lib/widgets/info_card.dart` - Displays metric data (value + icon + subtitle)
- `lib/widgets/function_button.dart` - Icon+label buttons with colored backgrounds
- `lib/widgets/weather_card.dart` - Weather display widget
- `lib/widgets/comparison_table.dart` - Data comparison grid
- `lib/widgets/inverter_card.dart` - Inverter status display
- `lib/widgets/circular_power_chart.dart` - Chart visualization
- `lib/widgets/data_view_card.dart` - Generic data container

## Styling & Theme

### Color System
Defined in [lib/utils/colors.dart](lib/utils/colors.dart):
- **Primary**: `0xFF0084EA` (bright blue) - used for buttons, headers
- **Background**: White
- **Secondary**: `0xFFE5F3FD` (light blue tint)
- **Text**: `0xFF1F2937` (dark gray)

**Always import `colors.dart`** for consistency. Don't hardcode hex values except for temporary UI testing.

### Theme Application
Global theme defined in [lib/utils/theme.dart](lib/utils/theme.dart):
- Uses `GoogleFonts.interTextTheme()` for typography
- Input fields: 12px rounded corners, blue focus border
- Buttons: 12px rounded, uppercase-friendly styling
- Applied via `ThemeData` in `main.dart`

**Pattern**: Screens use theme-aware styling (e.g., `kPrimaryColor`, `kTextColor`) rather than local overrides.

## Key Development Conventions

### File Organization
```
lib/
├── main.dart             # App entry, MaterialApp, theme config
├── screens/              # Full-screen widgets (LoginScreen, DashboardScreen, etc.)
├── widgets/              # Reusable UI components (cards, buttons, charts)
└── utils/                # Utilities (colors.dart, theme.dart)
```

### Widget Construction
- **Stateless by default** unless managing temporal state (e.g., LoginScreen password visibility toggle uses `_obscurePassword`)
- **Constructor parameters** for all customizable values (title, value, icon, color)
- **Const constructors** encouraged where possible for performance
- **super.key pattern** in all widget constructors

### Screen Structure Pattern
1. Scaffold with AppBar (if not splash/login)
2. AppBar: back arrow, centered title, actions (notifications)
3. Body: SingleChildScrollView wrapping Column for content
4. Standard padding: `symmetric(horizontal: 16.0, vertical: 20)`

### Navigation Implementation
- **Named routes**: Not used; direct MaterialPageRoute navigation
- **Back button**: Custom via `Navigator.pop(context)`
- **Data passing**: Through constructor params (not yet using state management)
- **Push vs Replace**: Splash uses `pushReplacement()` to prevent back; regular screens use `push()`

## External Dependencies

### Key Packages
- `google_fonts: ^7.1.0` - Custom typography (Inter font)
- `flutter_svg: ^2.2.3` - SVG asset support (placeholder icons used)
- `cupertino_icons: ^1.0.8` - iOS-style icons
- **Note**: No state management (Provider/Riverpod/BLoC) — app is currently stateless

### Linting
- Follows `package:flutter_lints` (see [analysis_options.yaml](analysis_options.yaml))
- No custom lint overrides active
- Run: `flutter analyze`

## Common Workflows

### Running the App
```bash
flutter pub get        # Fetch dependencies
flutter run            # Launch on connected device/emulator
flutter run -d chrome  # Run on web
```

### Testing
- No unit/widget tests configured yet (standard `flutter_test` available)
- To add: Create tests in `test/` directory

### Building
```bash
flutter build apk      # Android release
flutter build ios      # iOS release
flutter build web      # Web release
```

## Important Patterns NOT Currently Used
- **State Management**: No Provider/Riverpod/BLoC; data is hardcoded or passed via constructors
- **HTTP/API**: No network layer yet (mock data only)
- **Local Storage**: No persistence (SharedPreferences, Hive, etc.)
- **Animations**: Basic Material animations only; no custom AnimationControllers
- **Testing**: No test suite established

## When Adding Features
1. **New screens**: Create in `lib/screens/`, follow screen structure pattern (Scaffold + AppBar)
2. **New widgets**: Create in `lib/widgets/`, use const constructors, parameterize all values
3. **New colors/styles**: Add to `colors.dart` or `theme.dart`; don't hardcode values
4. **Navigation**: Use `Navigator.push(MaterialPageRoute(builder: ...))` pattern
5. **Assets/Fonts**: Uncomment sections in `pubspec.yaml`, rebuild

## Debugging Tips
- **Hot Reload**: `r` in terminal during `flutter run` (doesn't reset app state)
- **Hot Restart**: `R` in terminal (full restart, clears state)
- **DevTools**: `flutter pub global activate devtools` then `devtools` in separate terminal
- **Logs**: `flutter logs` for runtime output
