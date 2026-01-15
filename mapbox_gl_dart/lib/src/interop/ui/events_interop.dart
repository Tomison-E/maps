import 'dart:js_interop';

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart' as web;

@JS()
@anonymous
extension type MapMouseEventJsImpl._(JSObject _) implements JSObject {
  /// The event type.
  external String get type;

  /// The `MapboxMap` object that fired the event.
  external MapboxMapJsImpl get target;

  /// The DOM event which caused the map event.
  external web.MouseEvent get originalEvent;

  /// The pixel coordinates of the mouse cursor, relative to the map and measured from the top left corner.
  external PointJsImpl get point;

  /// The geographic location on the map of the mouse cursor.
  external LngLatJsImpl get lngLat;

  /// Prevents subsequent default processing of the event by the map.
  external void preventDefault();

  /// `true` if `preventDefault` has been called.
  external bool get defaultPrevented;
}

@JS()
@anonymous
extension type MapTouchEventJsImpl._(JSObject _) implements JSObject {
  /// The event type.
  external String get type;

  /// The `MapboxMap` object that fired the event.
  external MapboxMapJsImpl get target;

  /// The DOM event which caused the map event.
  external web.TouchEvent get originalEvent;

  /// The geographic location on the map of the center of the touch event points.
  external LngLatJsImpl get lngLat;

  /// The pixel coordinates of the center of the touch event points.
  external PointJsImpl get point;

  /// The array of pixel coordinates corresponding to touch points.
  external JSArray<PointJsImpl> get points;

  /// The geographical locations on the map corresponding to touch points.
  external JSArray<LngLatJsImpl> get lngLats;

  /// Prevents subsequent default processing of the event by the map.
  external void preventDefault();

  /// `true` if `preventDefault` has been called.
  external bool get defaultPrevented;
}
