import 'dart:js_interop';

export 'dart:js_interop' show JSAnyUtilityExtension;

/// This class is a wrapper for the jsObject. All the specific JsObject
/// wrappers extend from it.
abstract class JsObjectWrapper<T extends JSObject> {
  /// JS object.
  final T jsObject;

  /// Creates a new JsObjectWrapper type from a [jsObject].
  JsObjectWrapper.fromJsObject(this.jsObject);
}

@JS('Object.keys')
external JSArray<JSString> _objectKeys(JSObject? obj);

List<String> objectKeys(JSObject? obj) {
  return _objectKeys(obj).toDart.map((e) => e.toDart).toList();
}
