import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type DoubleClickZoomHandlerJsImpl._(JSObject _) implements JSObject {
  /// Returns a Boolean indicating whether the "double click to zoom" interaction is enabled.
  external bool isEnabled();

  /// Returns a Boolean indicating whether the "double click to zoom" interaction is active.
  external bool isActive();

  /// Enables the "double click to zoom" interaction.
  external void enable();

  /// Disables the "double click to zoom" interaction.
  external void disable();

  external void onTouchStart(MapTouchEventJsImpl e);

  external void onDblClick(MapMouseEventJsImpl e);
}
