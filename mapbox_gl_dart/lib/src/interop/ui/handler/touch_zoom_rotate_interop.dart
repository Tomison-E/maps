import 'dart:js_interop';
import 'package:web/web.dart' as web;

@JS()
@anonymous
extension type TouchZoomRotateHandlerJsImpl._(JSObject _) implements JSObject {
  /// Returns a Boolean indicating whether the "pinch to rotate and zoom" interaction is enabled.
  external bool isEnabled();

  /// Enables the "pinch to rotate and zoom" interaction.
  external void enable(JSAny? options);

  /// Disables the "pinch to rotate and zoom" interaction.
  external void disable();

  /// Disables the "pinch to rotate" interaction.
  external void disableRotation();

  /// Enables the "pinch to rotate" interaction.
  external void enableRotation();

  external void onStart(web.TouchEvent e);
}
