import 'dart:js_interop';

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart' as web;

/// A popup component.
@JS('mapboxgl.Popup')
extension type PopupJsImpl._(JSObject _) implements EventedJsImpl {
  external JSAny? get options;

  external factory PopupJsImpl([PopupOptionsJsImpl? options]);

  /// Adds the popup to a map.
  external PopupJsImpl addTo(MapboxMapJsImpl map);

  /// Returns true if the popup is open.
  external bool isOpen();

  /// Removes the popup from the map.
  external PopupJsImpl remove();

  /// Returns the geographical location of the popup's anchor.
  external LngLatJsImpl getLngLat();

  /// Sets the geographical location of the popup's anchor.
  external PopupJsImpl setLngLat(LngLatJsImpl lnglat);

  /// Tracks the popup anchor to the cursor position.
  external PopupJsImpl trackPointer();

  /// Returns the Popup's HTML element.
  external web.HTMLElement getElement();

  /// Sets the popup's content to a string of text.
  external PopupJsImpl setText(String text);

  /// Sets the popup's content to the HTML provided as a string.
  external PopupJsImpl setHTML(String? html);

  /// Returns the popup's maximum width.
  external String getMaxWidth();

  /// Sets the popup's maximum width.
  external PopupJsImpl setMaxWidth(String maxWidth);

  /// Sets the popup's content to the element provided as a DOM node.
  external PopupJsImpl setDOMContent(web.Node htmlNode);

  /// Adds a CSS class to the popup container element.
  external void addClassName(String className);

  /// Removes a CSS class from the popup container element.
  external void removeClassName(String className);

  /// Add or remove the given CSS class on the popup container.
  external bool toggleClassName(String className);
}

@JS()
@anonymous
extension type PopupOptionsJsImpl._(JSObject _) implements JSObject {
  external factory PopupOptionsJsImpl({
    bool? loseButton,
    bool? closeButton,
    bool? closeOnClick,
    String? anchor,
    JSAny? offset,
    String? className,
    String? maxWidth,
  });
}
