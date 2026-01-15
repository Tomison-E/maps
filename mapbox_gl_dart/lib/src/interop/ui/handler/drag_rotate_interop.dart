import 'dart:js_interop';
import 'package:web/web.dart' as web;

@JS()
@anonymous
extension type DragRotateHandlerJsImpl._(JSObject _) implements JSObject {
  /// Returns a Boolean indicating whether the "drag to rotate" interaction is enabled.
  external bool isEnabled();

  /// Returns a Boolean indicating whether the "drag to rotate" interaction is active.
  external bool isActive();

  /// Enables the "drag to rotate" interaction.
  external void enable();

  /// Disables the "drag to rotate" interaction.
  external void disable();

  external void onMouseDown(web.MouseEvent e);
}
