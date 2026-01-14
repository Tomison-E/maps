import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

/// A `LngLat` object represents a given longitude and latitude coordinate, measured in degrees.
///
/// Mapbox GL uses longitude, latitude coordinate order (as opposed to latitude, longitude) to match GeoJSON.
///
/// Note that any Mapbox GL method that accepts a `LngLat` object as an argument or option
/// can also accept an `Array` of two numbers and will perform an implicit conversion.
/// This flexible type is documented as {@link LngLatLike}.
///
/// @param {number} lng Longitude, measured in degrees.
/// @param {number} lat Latitude, measured in degrees.
/// @example
/// var ll = new mapboxgl.LngLat(-73.9749, 40.7736);
/// @see [Get coordinates of the mouse pointer](https://www.mapbox.com/mapbox-gl-js/example/mouse-position/)
/// @see [Display a popup](https://www.mapbox.com/mapbox-gl-js/example/popup/)
/// @see [Highlight features within a bounding box](https://www.mapbox.com/mapbox-gl-js/example/using-box-queryrenderedfeatures/)
/// @see [Create a timeline animation](https://www.mapbox.com/mapbox-gl-js/example/timeline-animation/)
@JS('mapboxgl.LngLat')
extension type LngLatJsImpl._(JSObject _) implements JSObject {
  external num get lng;
  external num get lat;

  external factory LngLatJsImpl(num lng, num lat);

  /// Returns a new `LngLat` object whose longitude is wrapped to the range (-180, 180).
  external LngLatJsImpl wrap();

  /// Returns the coordinates represented as an array of two numbers.
  external JSArray<JSNumber> toArray();

  /// Returns the coordinates represent as a string.
  @JS('toString')
  external String toJsString();

  /// Returns a `LngLatBounds` from the coordinates extended by a given `radius`.
  external LngLatBoundsJsImpl toBounds(num radius);

  /// Converts an array of two numbers or an object with `lng` and `lat` properties
  /// to a `LngLat` object.
  external static LngLatJsImpl convert(JSAny? input);
}
