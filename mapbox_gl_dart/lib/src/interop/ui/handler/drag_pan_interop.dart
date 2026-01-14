import 'dart:js_interop';
import 'package:web/web.dart' as web;

@JS()
@anonymous
extension type DragPanHandlerJsImpl._(JSObject _) implements JSObject {
  /// Returns a Boolean indicating whether the "drag to pan" interaction is enabled.
  external bool isEnabled();

  /// Returns a Boolean indicating whether the "drag to pan" interaction is active.
  external bool isActive();

  /// Enables the "drag to pan" interaction.
  external void enable();

  /// Disables the "drag to pan" interaction.
  external void disable();

  external void onMouseDown(web.MouseEvent e);

  external void onTouchStart(web.TouchEvent e);
}
