# mapbox_gl_wasm

WASM-compatible web platform implementation of the [Flutter Mapbox GL plugin](https://github.com/tobrun/flutter-mapbox-gl).

This library provides a WASM-compatible alternative to `mapbox_gl_web` that uses pure JavaScript interop (`dart:js_interop`) instead of `dart:html` and `dart:ui_web`. This makes it compatible with WebAssembly compilation targets.

## Features

- ✅ WASM-compatible (no `dart:html` or `dart:ui_web` dependencies)
- ✅ Pure JavaScript interop for all DOM operations
- ✅ Full Mapbox GL JS integration
- ✅ Same API as `mapbox_gl_web`

## Usage

To use this library instead of `mapbox_gl_web`, add it to your `pubspec.yaml`:

```yaml
dependencies:
  mapbox_gl_wasm:
    path: ../mapbox_gl_wasm
```

Then register the plugin in your web app:

```dart
import 'package:mapbox_gl_wasm/mapbox_gl_wasm.dart';

void main() {
  MapboxMapWasmPlugin.registerWith(registrar);
  runApp(MyApp());
}
```

## Differences from mapbox_gl_web

- Uses `dart:js_interop` instead of `dart:html`
- No `HtmlElementView` - uses custom widget with JS interop
- All DOM operations via JavaScript interop
- Compatible with WASM compilation targets

## Requirements

- Flutter 2.0.0 or higher
- Dart 2.12.0 or higher
- Mapbox GL JS v2.7.0 or compatible version

