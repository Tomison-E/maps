import 'dart:js_interop';
import 'package:web/web.dart' as web;

@JS()
@anonymous
extension type BoxZoomHandlerJsImpl._(JSObject _) implements JSObject {
  /// Returns a Boolean indicating whether the "box zoom" interaction is enabled.
  external bool isEnabled();

  /// Returns a Boolean indicating whether the "box zoom" interaction is active.
  external bool isActive();

  /// Enables the "box zoom" interaction.
  external void enable();

  /// Disables the "box zoom" interaction.
  external void disable();

  external void onMouseDown(web.MouseEvent e);
}
