library mapboxgl.style.sources.source;

import 'dart:js_interop';

abstract class Source<T extends JSObject> {
  final T jsObject;

  /// Creates a new JsObjectWrapper type from a [jsObject].
  Source.fromJsObject(this.jsObject);

  /// Dict object.
  Map<String, dynamic> get dict => throw Exception('dict not implemented!');
}
