import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type StyleSetterOptionsJsImpl._(JSObject _) implements JSObject {
  external bool get validate;

  external factory StyleSetterOptionsJsImpl({bool? validate});
}

@JS('mapboxgl.Style')
extension type StyleJsImpl._(JSObject _) implements EventedJsImpl {
  external void loadURL(String url, JSAny? options);

  external void loadJSON(JSAny? json, StyleSetterOptionsJsImpl option);

  external bool loaded();

  external bool hasTransitions();

  /// Apply queued style updates in a batch and recalculate zoom-dependent paint properties.
  external void update(EvaluationParametersJsImpl parameters);

  /// Update this style's state to match the given style JSON.
  external bool setState(JSAny? nextState);

  external void addImage(String id, StyleImageJsImpl image);

  external void updateImage(String id, StyleImageJsImpl image);

  external StyleImageJsImpl getImage(String id);

  external void removeImage(String id);

  external JSArray<JSString> listImages();

  external void addSource(
      String id, JSAny? source, StyleSetterOptionsJsImpl options);

  /// Remove a source from this stylesheet, given its id.
  external void removeSource(String id);

  /// Set the data of a GeoJSON source, given its id.
  external void setGeoJSONSourceData(String id, JSAny? data);

  /// Get a source by id.
  external JSAny? getSource(String id);

  /// Add a layer to the map style.
  external void addLayer(JSAny? layerObject,
      [String? before, StyleSetterOptionsJsImpl? options]);

  /// Moves a layer to a different z-position.
  external void moveLayer(String id, [String? before]);

  /// Remove the layer with the given id from the style.
  external void removeLayer(String id);

  /// Return the style layer object with the given `id`.
  external JSAny? getLayer(String id);

  external void setLayerZoomRange(String layerId, [num? minzoom, num? maxzoom]);

  external void setFilter(
      String layerId, JSAny? filter, StyleSetterOptionsJsImpl options);

  /// Get a layer's filter object.
  external JSAny? getFilter(String layer);

  external void setLayoutProperty(String layerId, String name, JSAny? value,
      StyleSetterOptionsJsImpl options);

  /// Get a layout property's value from a given layer.
  external JSAny? getLayoutProperty(String layerId, String name);

  external void setPaintProperty(String layerId, String name, JSAny? value,
      StyleSetterOptionsJsImpl options);

  external JSAny? getPaintProperty(String layer, String name);

  external void setFeatureState(JSAny? target, JSAny? state);

  external void removeFeatureState(JSAny? target, [String? key]);

  external JSAny? getFeatureState(JSAny? target);

  external JSAny? getTransition();

  external JSAny? serialize();

  external JSArray<JSAny?> querySourceFeatures(String sourceID, JSAny? params);

  external void addSourceType(String name, JSAny? sourceType, JSFunction callback);

  external JSAny? getLight();

  external void setLight(JSAny? lightOptions, StyleSetterOptionsJsImpl options);

  // Callbacks from web workers
  external void getImages(String mapId, JSAny? params, JSFunction callback);

  external void getGlyphs(String mapId, JSAny? params, JSFunction callback);

  external void getResource(
      String mapId, RequestParametersJsImpl params, JSFunction callback);
}

@JS()
@anonymous
extension type StyleFunctionJsImpl._(JSObject _) implements JSObject {
  external factory StyleFunctionJsImpl({
    JSAny? base,
    JSAny? stops,
  });
}
