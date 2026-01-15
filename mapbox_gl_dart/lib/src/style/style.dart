library mapboxgl.style.style;

import 'dart:js_interop';

import 'package:mapbox_gl_dart/mapbox_gl_dart.dart';
import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:mapbox_gl_dart/src/utils.dart';

class StyleSetterOptions extends JsObjectWrapper<StyleSetterOptionsJsImpl> {
  bool get validate => jsObject.validate;

  /// Creates a new StyleSetterOptions from a [jsObject].
  StyleSetterOptions.fromJsObject(StyleSetterOptionsJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

class Style extends JsObjectWrapper<StyleJsImpl> {
  loadURL(String url, dynamic options) =>
      jsObject.loadURL(url, jsifyAny(options));

  loadJSON(dynamic json, StyleSetterOptions option) =>
      jsObject.loadJSON(jsifyAny(json), option.jsObject);

  loaded() => jsObject.loaded();

  hasTransitions() => jsObject.hasTransitions();

  ///  Apply queued style updates in a batch and recalculate zoom-dependent paint properties.
  update(EvaluationParameters parameters) =>
      jsObject.update(parameters.jsObject);

  ///  Update this style's state to match the given style JSON, performing only
  ///  the necessary mutations.
  ///
  ///  May throw an Error ('Unimplemented: METHOD') if the mapbox-gl-style-spec
  ///  diff algorithm produces an operation that is not supported.
  ///
  ///  @returns {boolean} true if any changes were made; false otherwise
  ///  @private
  setState(dynamic nextState) => jsObject.setState(jsifyAny(nextState));

  addImage(String id, StyleImage image) =>
      jsObject.addImage(id, image.jsObject);

  updateImage(String id, StyleImage image) =>
      jsObject.updateImage(id, image.jsObject);

  StyleImage getImage(String id) =>
      StyleImage.fromJsObject(jsObject.getImage(id));

  removeImage(String id) => jsObject.removeImage(id);

  listImages() => jsObject.listImages().toDart.map((e) => e.toDart).toList();

  addSource(String id, dynamic source, StyleSetterOptions options) =>
      jsObject.addSource(id, jsifyAny(source), options.jsObject);

  ///  Remove a source from this stylesheet, given its id.
  ///  @param {string} id id of the source to remove
  ///  @throws {Error} if no source is found with the given ID
  removeSource(String id) => jsObject.removeSource(id);

  ///  Set the data of a GeoJSON source, given its id.
  ///  @param {string} id id of the source
  ///  @param {GeoJSON|string} data GeoJSON source
  setGeoJSONSourceData(String id, dynamic data) =>
      jsObject.setGeoJSONSourceData(id, jsifyAny(data));

  ///  Get a source by id.
  ///  @param {string} id id of the desired source
  ///  @returns {Object} source
  dynamic getSource(String id) => jsObject.getSource(id);

  ///  Add a layer to the map style. The layer will be inserted before the layer with
  ///  ID `before`, or appended if `before` is omitted.
  ///  @param {string} [before] ID of an existing layer to insert before
  addLayer(dynamic layerObject,
          [String? before, StyleSetterOptions? options]) =>
      jsObject.addLayer(jsifyAny(layerObject), before, options?.jsObject);

  ///  Moves a layer to a different z-position. The layer will be inserted before the layer with
  ///  ID `before`, or appended if `before` is omitted.
  ///  @param {string} id  ID of the layer to move
  ///  @param {string} [before] ID of an existing layer to insert before
  moveLayer(String id, [String? before]) => jsObject.moveLayer(id, before);

  ///  Remove the layer with the given id from the style.
  ///
  ///  If no such layer exists, an `error` event is fired.
  ///
  ///  @param {string} id id of the layer to remove
  ///  @fires error
  removeLayer(String id) => jsObject.removeLayer(id);

  ///  Return the style layer object with the given `id`.
  ///
  ///  @param {string} id - id of the desired layer
  ///  @returns {?Object} a layer, if one with the given `id` exists
  dynamic getLayer(String id) => jsObject.getLayer(id);

  setLayerZoomRange(String layerId, [num? minzoom, num? maxzoom]) =>
      jsObject.setLayerZoomRange(layerId, minzoom, maxzoom);

  setFilter(String layerId, dynamic filter, StyleSetterOptions options) =>
      jsObject.setFilter(layerId, jsifyAny(filter), options.jsObject);

  ///  Get a layer's filter object
  ///  @param {string} layer the layer to inspect
  ///  @returns {*} the layer's filter, if any
  getFilter(String layer) => jsObject.getFilter(layer);

  setLayoutProperty(String layerId, String name, dynamic value,
          StyleSetterOptions options) =>
      jsObject.setLayoutProperty(
          layerId, name, jsifyAny(value), options.jsObject);

  ///  Get a layout property's value from a given layer
  ///  @param {string} layerId the layer to inspect
  ///  @param {string} name the name of the layout property
  ///  @returns {*} the property value
  getLayoutProperty(String layerId, String name) =>
      jsObject.getLayoutProperty(layerId, name);

  setPaintProperty(String layerId, String name, dynamic value,
          StyleSetterOptions options) =>
      jsObject.setPaintProperty(
          layerId, name, jsifyAny(value), options.jsObject);

  getPaintProperty(String layer, String name) =>
      jsObject.getPaintProperty(layer, name);

  setFeatureState(dynamic target, dynamic state) =>
      jsObject.setFeatureState(jsifyAny(target), jsifyAny(state));

  removeFeatureState(dynamic target, [String? key]) =>
      jsObject.removeFeatureState(jsifyAny(target), key);

  getFeatureState(dynamic target) => jsObject.getFeatureState(jsifyAny(target));

  getTransition() => jsObject.getTransition();

  serialize() => jsObject.serialize();

  querySourceFeatures(String sourceID, dynamic params) =>
      jsObject.querySourceFeatures(sourceID, jsifyAny(params));

  addSourceType(String name, dynamic sourceType, JSFunction callback) =>
      jsObject.addSourceType(name, jsifyAny(sourceType), callback);

  getLight() => jsObject.getLight();

  setLight(dynamic lightOptions, StyleSetterOptions options) =>
      jsObject.setLight(jsifyAny(lightOptions), options.jsObject);

  // Callbacks from web workers

  getImages(String mapId, dynamic params, JSFunction callback) =>
      jsObject.getImages(mapId, jsifyAny(params), callback);

  getGlyphs(String mapId, dynamic params, JSFunction callback) =>
      jsObject.getGlyphs(mapId, jsifyAny(params), callback);

  getResource(String mapId, RequestParameters params, JSFunction callback) =>
      jsObject.getResource(mapId, params.jsObject, callback);

  /// Creates a new Style from a [jsObject].
  Style.fromJsObject(StyleJsImpl jsObject) : super.fromJsObject(jsObject);
}

class StyleFunction extends JsObjectWrapper<StyleFunctionJsImpl> {
  factory StyleFunction({
    dynamic base,
    dynamic stops,
  }) =>
      StyleFunction.fromJsObject(
          StyleFunctionJsImpl(base: jsifyAny(base), stops: jsifyAny(stops)));

  /// Creates a new StyleFunction from a [jsObject].
  StyleFunction.fromJsObject(StyleFunctionJsImpl jsObject)
      : super.fromJsObject(jsObject);
}
