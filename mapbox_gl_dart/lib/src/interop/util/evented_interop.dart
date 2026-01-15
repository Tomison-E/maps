import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

typedef ListenerJsImpl = JSFunction;

@JS()
@anonymous
extension type EventJsImpl._(JSObject _) implements JSObject {
  external String get id;
  external String get type;
  external LngLatJsImpl get lngLat;
  external JSArray<FeatureJsImpl> get features;
  external PointJsImpl get point;

  external factory EventJsImpl({
    String? id,
    String? type,
    LngLatJsImpl? lngLat,
    JSArray<FeatureJsImpl>? features,
    PointJsImpl? point,
  });

  external void preventDefault();
}

@JS('mapboxgl.Evented')
extension type EventedJsImpl._(JSObject _) implements JSObject {
  /// Adds a listener to a specified event type.
  external MapboxMapJsImpl on(String type,
      [JSAny? layerIdOrListener, JSFunction? listener]);

  /// Removes a previously registered event listener.
  external MapboxMapJsImpl off(String type,
      [JSAny? layerIdOrListener, JSFunction? listener]);

  /// Adds a listener that will be called only once to a specified event type.
  external MapboxMapJsImpl once(String type, JSFunction listener);

  external void fire(EventJsImpl event, [JSAny? properties]);

  /// Returns true if this instance of Evented has a listener for the specified type.
  external bool listens(String type);

  /// Bubble all events fired by this instance of Evented to this parent instance of Evented.
  external void setEventedParent([EventedJsImpl? parent, JSAny? data]);
}
