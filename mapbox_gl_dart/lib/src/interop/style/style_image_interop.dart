import 'dart:js_interop';

@JS()
@anonymous
extension type StyleImageJsImpl._(JSObject _) implements JSObject {
  external JSAny? get data;
  external num get pixelRatio;
  external bool get sdf;
  external num get version;
  external bool get hasRenderCallback;
  external StyleImageInterfaceJsImpl get userImage;
}

@JS()
@anonymous
extension type StyleImageInterfaceJsImpl._(JSObject _) implements JSObject {
  external num get width;
  external num get height;
  external JSAny? get data;
  external JSFunction? get render;
  external JSFunction? get onAdd;
  external JSFunction? get onRemove;
}
