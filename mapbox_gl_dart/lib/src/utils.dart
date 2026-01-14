import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import 'interop/js.dart';

/// Creates an empty JS object - WASM compatible
@JS('Object')
external JSObject _createJsObject();

JSObject createEmptyJsObject() => _createJsObject();

/// Returns Dart representation from JS Object.
dynamic dartify(JSAny? jsObject) {
  if (jsObject == null) {
    return null;
  }
  if (jsObject.isA<JSNumber>()) {
    return (jsObject as JSNumber).toDartDouble;
  }
  if (jsObject.isA<JSBoolean>()) {
    return (jsObject as JSBoolean).toDart;
  }
  if (jsObject.isA<JSString>()) {
    return (jsObject as JSString).toDart;
  }
  if (jsObject.isA<JSArray>()) {
    return (jsObject as JSArray)
        .toDart
        .map((e) => dartify(e))
        .toList();
  }
  // Assume a map then...
  return dartifyMap(jsObject as JSObject);
}

Map<String, dynamic> dartifyMap(JSObject? jsObject) {
  if (jsObject == null) {
    return <String, dynamic>{};
  }
  var keys = objectKeys(jsObject);
  var map = <String, dynamic>{};
  for (var key in keys) {
    map[key] = dartify(jsObject[key]);
  }
  return map;
}

/// Converts a Dart Map to a JS Object
/// Skips null values to avoid passing nulls to JS APIs that don't expect them
JSObject jsifyMap(Map<String, dynamic> map) {
  final jsObject = createEmptyJsObject();
  for (final entry in map.entries) {
    // Skip null values - don't add them to the JS object
    if (entry.value != null) {
      jsObject[entry.key] = _jsifyValue(entry.value);
    }
  }
  return jsObject;
}

/// Creates a JS array from a Dart list - WASM compatible
JSArray jsifyList(List list) {
  // Convert each item and collect in a Dart list first
  final List<JSAny?> jsItems = [];
  for (final item in list) {
    jsItems.add(_jsifyValue(item));
  }
  // Convert the list of JSAny to JSArray
  return jsItems.toJS;
}

JSAny? _jsifyValue(dynamic value) {
  if (value == null) {
    return null;
  }
  // Check for JSAny first - this handles already-converted JS values
  // including JSUint8Array, JSArray, JSObject, etc.
  if (value is JSAny) {
    return value;
  }
  if (value is String) {
    return value.toJS;
  }
  if (value is num) {
    return value.toJS;
  }
  if (value is bool) {
    return value.toJS;
  }
  // Handle typed data (Uint8List, etc.) before regular List
  if (value is Uint8List) {
    return value.toJS;
  }
  if (value is List) {
    return jsifyList(value);
  }
  if (value is Map<String, dynamic>) {
    return jsifyMap(value);
  }
  if (value is Map) {
    return jsifyMap(Map<String, dynamic>.from(value));
  }
  return null;
}

/// Universal jsify that works with any Dart type.
/// This is WASM-compatible unlike the extension method `.jsify()`.
JSAny? jsifyAny(dynamic value) => _jsifyValue(value);

/// Alias for jsifyMap for backward compatibility
JSObject jsify(dynamic value) {
  if (value is Map<String, dynamic>) {
    return jsifyMap(value);
  }
  if (value is Map) {
    return jsifyMap(Map<String, dynamic>.from(value));
  }
  if (value is JSObject) {
    return value;
  }
  throw ArgumentError('Cannot jsify value of type ${value.runtimeType}');
}
