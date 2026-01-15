import 'dart:js_interop';

@JS()
@anonymous
extension type KeyboardHandlerJsImpl._(JSObject _) implements JSObject {
  /// Returns a Boolean indicating whether keyboard interaction is enabled.
  external bool isEnabled();

  /// Enables keyboard interaction.
  external void enable();

  /// Disables keyboard interaction.
  external void disable();
}
