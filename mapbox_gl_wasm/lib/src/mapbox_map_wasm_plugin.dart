part of mapbox_gl_wasm;

class MapboxMapWasmPlugin {
  /// Registers this class as the default instance of [MapboxGlPlatform].
  static void registerWith(Registrar registrar) {
    MapboxGlPlatform.createInstance = () => MapboxWasmGlPlatform();
  }
}

