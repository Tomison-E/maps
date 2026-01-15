import 'dart:js_interop';

@JS()
@anonymous
extension type FeatureCollectionJsImpl._(JSObject _) implements JSObject {
  external String get type;
  external JSArray<FeatureJsImpl> get features;

  external factory FeatureCollectionJsImpl({
    String type,
    JSArray<FeatureJsImpl> features,
  });
}

@JS()
@anonymous
extension type FeatureJsImpl._(JSObject _) implements JSObject {
  external JSAny? get id;
  external set id(JSAny? id);
  external String get type;
  external GeometryJsImpl get geometry;
  external JSObject? get properties;
  external String get source;

  external factory FeatureJsImpl({
    JSAny? id,
    String? type,
    GeometryJsImpl geometry,
    JSObject? properties,
    String? source,
  });
}

@JS()
@anonymous
extension type GeometryJsImpl._(JSObject _) implements JSObject {
  external String get type;
  external JSAny? get coordinates;

  external factory GeometryJsImpl({
    String? type,
    JSAny? coordinates,
  });
}
