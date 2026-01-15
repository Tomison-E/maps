import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:mapbox_gl_dart/src/utils.dart';

class FeatureCollection extends JsObjectWrapper<FeatureCollectionJsImpl> {
  String get type => jsObject.type;
  List<Feature> get features =>
      jsObject.features.toDart.map((f) => Feature.fromJsObject(f)).toList();

  factory FeatureCollection({
    required List<Feature> features,
  }) {
    return FeatureCollection.fromJsObject(FeatureCollectionJsImpl(
      type: 'FeatureCollection',
      features: features.map((f) => f.jsObject).toList().toJS,
    ));
  }

  /// Creates a new FeatureCollection from a [jsObject].
  FeatureCollection.fromJsObject(super.jsObject) : super.fromJsObject();
}

class Feature extends JsObjectWrapper<FeatureJsImpl> {
  dynamic get id {
    final jsId = jsObject.id;
    if (jsId == null) return null;
    if (jsId.isA<JSNumber>()) return (jsId as JSNumber).toDartDouble;
    if (jsId.isA<JSString>()) return (jsId as JSString).toDart;
    return jsId;
  }

  set id(dynamic id) {
    if (id == null) {
      jsObject.id = null;
    } else if (id is num) {
      jsObject.id = id.toJS;
    } else if (id is String) {
      jsObject.id = id.toJS;
    } else {
      jsObject.id = id as JSAny?;
    }
  }

  String get type => jsObject.type;
  Geometry get geometry => Geometry.fromJsObject(jsObject.geometry);
  Map<String, dynamic> get properties => dartifyMap(jsObject.properties);
  String get source => jsObject.source;

  factory Feature({
    dynamic id,
    required Geometry geometry,
    Map<String, dynamic>? properties,
    String? source,
  }) {
    JSAny? jsId;
    if (id is num) {
      jsId = id.toJS;
    } else if (id is String) {
      jsId = id.toJS;
    } else {
      jsId = id as JSAny?;
    }

    return Feature.fromJsObject(FeatureJsImpl(
      type: 'Feature',
      id: jsId,
      geometry: geometry.jsObject,
      properties: properties == null ? jsify({}) : jsify(properties),
      source: source,
    ));
  }

  Feature copyWith({
    dynamic id,
    Geometry? geometry,
    Map<String, dynamic>? properties,
    String? source,
  }) {
    JSAny? jsId;
    final newId = id ?? this.id;
    if (newId is num) {
      jsId = newId.toJS;
    } else if (newId is String) {
      jsId = newId.toJS;
    } else {
      jsId = newId as JSAny?;
    }

    return Feature.fromJsObject(FeatureJsImpl(
      type: 'Feature',
      id: jsId,
      geometry: geometry != null ? geometry.jsObject : this.geometry.jsObject,
      properties:
          properties != null ? jsify(properties) : jsify(this.properties),
      source: source ?? this.source,
    ));
  }

  /// Creates a new Feature from a [jsObject].
  Feature.fromJsObject(super.jsObject) : super.fromJsObject();
}

class Geometry extends JsObjectWrapper<GeometryJsImpl> {
  String get type => jsObject.type;
  dynamic get coordinates => jsObject.coordinates;

  factory Geometry({
    String? type,
    dynamic coordinates,
  }) {
    // Convert Dart types to JS for WASM compatibility
    JSAny? jsCoordinates;
    if (coordinates == null) {
      jsCoordinates = null;
    } else if (coordinates is JSAny) {
      // Already a JS value
      jsCoordinates = coordinates;
    } else if (coordinates is List) {
      // Convert Dart List to JS Array
      jsCoordinates = coordinates.jsify();
    } else {
      // Try to use as-is (might fail in WASM)
      jsCoordinates = coordinates as JSAny?;
    }

    return Geometry.fromJsObject(GeometryJsImpl(
      type: type,
      coordinates: jsCoordinates,
    ));
  }

  /// Creates a new Geometry from a [jsObject].
  Geometry.fromJsObject(super.jsObject) : super.fromJsObject();
}
