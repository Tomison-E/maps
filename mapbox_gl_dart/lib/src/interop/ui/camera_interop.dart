import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

/// Options common to jumpTo, easeTo, and flyTo.
@JS()
@anonymous
extension type CameraOptionsJsImpl._(JSObject _) implements JSObject {
  external LngLatJsImpl? get center;
  external num? get zoom;
  external num? get bearing;
  external num? get pitch;
  external LngLatJsImpl? get around;

  external factory CameraOptionsJsImpl({
    LngLatJsImpl? center,
    num? zoom,
    num? bearing,
    num? pitch,
    LngLatJsImpl? around,
  });
}

/// Options common to map movement methods that involve animation.
@JS()
@anonymous
extension type AnimationOptionsJsImpl._(JSObject _) implements JSObject {
  external num? get duration;
  external JSFunction? get easing;
  external PointJsImpl? get offset;
  external bool? get animate;
  external bool? get essential;

  external factory AnimationOptionsJsImpl({
    num? duration,
    JSFunction? easing,
    PointJsImpl? offset,
    bool? animate,
    bool? essential,
  });
}

/// Options for setting padding on a call to fitBounds.
@JS()
@anonymous
extension type PaddingOptionsJsImpl._(JSObject _) implements JSObject {
  external num? get top;
  external num? get bottom;
  external num? get left;
  external num? get right;

  external factory PaddingOptionsJsImpl({
    num? top,
    num? bottom,
    num? left,
    num? right,
  });
}

@JS('mapboxgl.Camera')
extension type CameraJsImpl._(JSObject _) implements EventedJsImpl {
  /// Returns the map's geographical centerpoint.
  external LngLatJsImpl getCenter();

  /// Sets the map's geographical centerpoint.
  external MapboxMapJsImpl setCenter(LngLatJsImpl center, [JSAny? eventData]);

  /// Pans the map by the specified offset.
  external MapboxMapJsImpl panBy(PointJsImpl offset,
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Pans the map to the specified location, with an animated transition.
  external MapboxMapJsImpl panTo(LngLatJsImpl lnglat,
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Returns the map's current zoom level.
  external num getZoom();

  /// Sets the map's zoom level.
  external MapboxMapJsImpl setZoom(num zoom, [JSAny? eventData]);

  /// Zooms the map to the specified zoom level, with an animated transition.
  external MapboxMapJsImpl zoomTo(num zoom,
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Increases the map's zoom level by 1.
  external MapboxMapJsImpl zoomIn(
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Decreases the map's zoom level by 1.
  external MapboxMapJsImpl zoomOut(
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Returns the map's current bearing.
  external num getBearing();

  /// Sets the map's bearing (rotation).
  external MapboxMapJsImpl setBearing(num bearing, [JSAny? eventData]);

  /// Rotates the map to the specified bearing, with an animated transition.
  external MapboxMapJsImpl rotateTo(num bearing,
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Rotates the map so that north is up.
  external MapboxMapJsImpl resetNorth(
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Rotates and pitches the map so that north is up and pitch is 0.
  external MapboxMapJsImpl resetNorthPitch(
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Snaps the map so that north is up.
  external MapboxMapJsImpl snapToNorth(
      [AnimationOptionsJsImpl? options, JSAny? eventData]);

  /// Returns the map's current pitch (tilt).
  external num getPitch();

  /// Sets the map's pitch (tilt).
  external MapboxMapJsImpl setPitch(num pitch, [JSAny? eventData]);

  /// Returns CameraOptions for given bounds.
  external CameraOptionsJsImpl cameraForBounds(LngLatBoundsJsImpl bounds,
      [JSAny? options]);

  /// Pans and zooms the map to contain its visible area within the specified geographical bounds.
  external MapboxMapJsImpl fitBounds(LngLatBoundsJsImpl bounds,
      [JSAny? options, JSAny? eventData]);

  /// Pans, rotates and zooms the map to fit the box made by points p0 and p1.
  external MapboxMapJsImpl fitScreenCoordinates(
      PointJsImpl p0, PointJsImpl p1, num bearing,
      [JSAny? options, JSAny? eventData]);

  /// Changes any combination of center, zoom, bearing, and pitch without animation.
  external MapboxMapJsImpl jumpTo(CameraOptionsJsImpl options,
      [JSAny? eventData]);

  /// Changes any combination of center, zoom, bearing, and pitch with animation.
  external MapboxMapJsImpl easeTo(JSAny? options, [JSAny? eventData]);

  /// Changes any combination of center, zoom, bearing, and pitch with flight animation.
  external MapboxMapJsImpl flyTo(JSAny? options, [JSAny? eventData]);

  external bool isEasing();

  /// Stops any animated transition underway.
  external MapboxMapJsImpl stop();
}
