import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

/// A `LogoControl` is a control that adds the Mapbox watermark
/// to the map as required by the terms of service for Mapbox
/// vector tiles and core styles.
@JS('mapboxgl.LogoControl')
extension type LogoControlJsImpl._(JSObject _) implements JSObject {
  external factory LogoControlJsImpl();

  external JSAny? onAdd(MapboxMapJsImpl map);

  external void onRemove();

  external String getDefaultPosition();
}
