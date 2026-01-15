import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type GeolocateControlOptionsJsImpl._(JSObject _) implements JSObject {
  external PositionOptionsJsImpl? get positionOptions;
  external JSAny? get fitBoundsOptions;
  external bool? get trackUserLocation;
  external bool? get showAccuracyCircle;
  external bool? get showUserLocation;

  external factory GeolocateControlOptionsJsImpl({
    PositionOptionsJsImpl? positionOptions,
    JSAny? fitBoundsOptions,
    bool? trackUserLocation,
    bool? showAccuracyCircle,
    bool? showUserLocation,
  });
}

@JS()
@anonymous
extension type PositionOptionsJsImpl._(JSObject _) implements JSObject {
  external bool? get enableHighAccuracy;
  external num? get maximumAge;
  external num? get timeout;

  external factory PositionOptionsJsImpl({
    bool? enableHighAccuracy,
    num? maximumAge,
    num? timeout,
  });
}

@JS('mapboxgl.GeolocateControl')
extension type GeolocateControlJsImpl._(JSObject _) implements EventedJsImpl {
  external GeolocateControlOptionsJsImpl get options;

  external factory GeolocateControlJsImpl(GeolocateControlOptionsJsImpl options);

  external JSAny? onAdd(MapboxMapJsImpl map);

  external void onRemove(MapboxMapJsImpl map);

  external void trigger();
}
