import 'dart:js_interop';
import 'package:web/web.dart' as web;

@JS()
@anonymous
extension type ScrollZoomHandlerJsImpl._(JSObject _) implements JSObject {
  /// Set the zoom rate of a trackpad.
  external void setZoomRate(num zoomRate);

  /// Set the zoom rate of a mouse wheel.
  external void setWheelZoomRate(num wheelZoomRate);

  /// Returns a Boolean indicating whether the "scroll to zoom" interaction is enabled.
  external bool isEnabled();

  /// Returns a Boolean indicating whether the "scroll to zoom" interaction is active.
  external bool isActive();

  external bool isZooming();

  /// Enables the "scroll to zoom" interaction.
  external void enable(JSAny? options);

  /// Disables the "scroll to zoom" interaction.
  external void disable();

  external void onWheel(web.WheelEvent e);
}
