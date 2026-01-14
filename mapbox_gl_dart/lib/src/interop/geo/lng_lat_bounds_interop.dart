import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

/// A `LngLatBounds` object represents a geographical bounding box,
/// defined by its southwest and northeast points in longitude and latitude.
///
/// If no arguments are provided to the constructor, a `null` bounding box is created.
///
/// Note that any Mapbox GL method that accepts a `LngLatBounds` object as an argument or option
/// can also accept an `Array` of two {@link LngLatLike} constructs and will perform an implicit conversion.
/// This flexible type is documented as {@link LngLatBoundsLike}.
///
/// @param {LngLatLike} [sw] The southwest corner of the bounding box.
/// @param {LngLatLike} [ne] The northeast corner of the bounding box.
/// @example
/// var sw = new mapboxgl.LngLat(-73.9876, 40.7661);
/// var ne = new mapboxgl.LngLat(-73.9397, 40.8002);
/// var llb = new mapboxgl.LngLatBounds(sw, ne);
@JS('mapboxgl.LngLatBounds')
extension type LngLatBoundsJsImpl._(JSObject _) implements JSObject {
  external LngLatJsImpl get sw;
  external LngLatJsImpl get ne;

  external factory LngLatBoundsJsImpl(LngLatJsImpl sw, LngLatJsImpl ne);

  /// Set the northeast corner of the bounding box
  external LngLatBoundsJsImpl setNorthEast(LngLatJsImpl ne);

  /// Set the southwest corner of the bounding box
  external LngLatBoundsJsImpl setSouthWest(LngLatJsImpl sw);

  /// Extend the bounds to include a given LngLat or LngLatBounds.
  external LngLatBoundsJsImpl extend(JSAny? obj);

  /// Returns the geographical coordinate equidistant from the bounding box's corners.
  external LngLatJsImpl getCenter();

  /// Returns the southwest corner of the bounding box.
  external LngLatJsImpl getSouthWest();

  /// Returns the northeast corner of the bounding box.
  external LngLatJsImpl getNorthEast();

  /// Returns the northwest corner of the bounding box.
  external LngLatJsImpl getNorthWest();

  /// Returns the southeast corner of the bounding box.
  external LngLatJsImpl getSouthEast();

  /// Returns the west edge of the bounding box.
  external num getWest();

  /// Returns the south edge of the bounding box.
  external num getSouth();

  /// Returns the east edge of the bounding box.
  external num getEast();

  /// Returns the north edge of the bounding box.
  external num getNorth();

  /// Returns the bounding box represented as an array.
  external JSArray<JSArray<JSNumber>> toArray();

  /// Return the bounding box represented as a string.
  @JS('toString')
  external String toJsString();

  /// Check if the bounding box is an empty/`null`-type box.
  external bool isEmpty();

  /// Check if the point is within the bounding box.
  external bool contains(LngLatJsImpl lnglat);

  /// Converts an array to a `LngLatBounds` object.
  external static LngLatBoundsJsImpl convert(JSAny? input);
}
