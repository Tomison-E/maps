import 'dart:js_interop';

@JS()
@anonymous
extension type PointJsImpl._(JSObject _) implements JSObject {
  external num get x;
  external num get y;

  external factory PointJsImpl({num x, num y});
}
