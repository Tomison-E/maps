import 'dart:js_interop';

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart' as web;

/// Creates a marker component.
@JS('mapboxgl.Marker')
extension type MarkerJsImpl._(JSObject _) implements EventedJsImpl {
  external factory MarkerJsImpl([MarkerOptionsJsImpl? options]);

  /// Attaches the marker to a map.
  external MarkerJsImpl addTo(MapboxMapJsImpl map);

  /// Removes the marker from a map.
  external MarkerJsImpl remove();

  /// Get the marker's geographical location.
  external LngLatJsImpl getLngLat();

  /// Set the marker's geographical position and move it.
  external MarkerJsImpl setLngLat(LngLatJsImpl lnglat);

  /// Returns the Marker's HTML element.
  external web.HTMLElement getElement();

  /// Binds a Popup to the Marker.
  external MarkerJsImpl setPopup(PopupJsImpl popup);

  /// Returns the Popup instance that is bound to the Marker.
  external PopupJsImpl getPopup();

  /// Opens or closes the bound popup.
  external MarkerJsImpl togglePopup();

  /// Get the marker's offset.
  external PointJsImpl getOffset();

  /// Sets the offset of the marker.
  external MarkerJsImpl setOffset(PointJsImpl offset);

  /// Sets the draggable property of the marker.
  external MarkerJsImpl setDraggable(bool shouldBeDraggable);

  /// Returns true if the marker can be dragged.
  external bool isDraggable();

  /// Sets the rotation property of the marker.
  external MarkerJsImpl setRotation(num rotation);

  /// Returns the current rotation angle of the marker.
  external num getRotation();

  /// Sets the rotationAlignment property of the marker.
  external MarkerJsImpl setRotationAlignment(String alignment);

  /// Returns the current rotationAlignment property of the marker.
  external String getRotationAlignment();

  /// Sets the pitchAlignment property of the marker.
  external MarkerJsImpl setPitchAlignment(String alignment);

  /// Returns the current pitchAlignment property of the marker.
  external String getPitchAlignment();
}

@JS()
@anonymous
extension type MarkerOptionsJsImpl._(JSObject _) implements JSObject {
  external factory MarkerOptionsJsImpl({
    web.HTMLElement? element,
    PointJsImpl? offset,
    String? anchor,
    String? color,
    bool? draggable,
    num? rotation,
    String? rotationAlignment,
    String? pitchAlignment,
  });
}
