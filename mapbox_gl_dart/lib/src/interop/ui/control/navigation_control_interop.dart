import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type NavigationControlOptionsJsImpl._(JSObject _) implements JSObject {
  external bool? get showCompass;
  external bool? get showZoom;
  external bool? get visualizePitch;

  external factory NavigationControlOptionsJsImpl({
    bool? showCompass,
    bool? showZoom,
    bool? visualizePitch,
  });
}

/// A `NavigationControl` control contains zoom buttons and a compass.
@JS('mapboxgl.NavigationControl')
extension type NavigationControlJsImpl._(JSObject _) implements JSObject {
  external NavigationControlOptionsJsImpl get options;

  external factory NavigationControlJsImpl(
      NavigationControlOptionsJsImpl options);

  external JSAny? onAdd(MapboxMapJsImpl map);

  external void onRemove();
}
