import 'dart:js_interop';

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart' as web;

/// The `MapboxMap` object represents the map on your page.
@JS('mapboxgl.Map')
extension type MapboxMapJsImpl._(JSObject _) implements CameraJsImpl {
  external factory MapboxMapJsImpl(MapOptionsJsImpl options);

  external StyleJsImpl get style;
  external JSAny? get painter;

  /// The map's ScrollZoomHandler.
  external ScrollZoomHandlerJsImpl get scrollZoom;

  /// The map's BoxZoomHandler.
  external BoxZoomHandlerJsImpl get boxZoom;

  /// The map's DragRotateHandler.
  external DragRotateHandlerJsImpl get dragRotate;

  /// The map's DragPanHandler.
  external DragPanHandlerJsImpl get dragPan;

  /// The map's KeyboardHandler.
  external KeyboardHandlerJsImpl get keyboard;

  /// The map's DoubleClickZoomHandler.
  external DoubleClickZoomHandlerJsImpl get doubleClickZoom;

  /// The map's TouchZoomRotateHandler.
  external TouchZoomRotateHandlerJsImpl get touchZoomRotate;

  /// Adds an IControl to the map.
  external MapboxMapJsImpl addControl(IControlJsImpl? control,
      [String? position]);

  /// Removes the control from the map.
  external MapboxMapJsImpl removeControl(IControlJsImpl? control);

  /// Resizes the map according to the dimensions of its container element.
  external MapboxMapJsImpl resize([JSAny? eventData]);

  /// Returns the map's geographical bounds.
  external LngLatBoundsJsImpl getBounds();

  /// Returns the maximum geographical bounds the map is constrained to.
  external LngLatBoundsJsImpl getMaxBounds();

  /// Sets or clears the map's geographical bounds.
  external MapboxMapJsImpl setMaxBounds(LngLatBoundsJsImpl? bounds);

  /// Sets or clears the map's minimum zoom level.
  external MapboxMapJsImpl setMinZoom([num? minZoom]);

  /// Returns the map's minimum allowable zoom level.
  external num getMinZoom();

  /// Sets or clears the map's maximum zoom level.
  external MapboxMapJsImpl setMaxZoom([num? maxZoom]);

  /// Returns the map's maximum allowable zoom level.
  external num getMaxZoom();

  /// Sets or clears the map's minimum pitch.
  external MapboxMapJsImpl setMinPitch([num? minPitch]);

  /// Returns the map's minimum allowable pitch.
  external num getMinPitch();

  /// Sets or clears the map's maximum pitch.
  external MapboxMapJsImpl setMaxPitch([num? maxPitch]);

  /// Returns the map's maximum allowable pitch.
  external num getMaxPitch();

  /// Returns the state of `renderWorldCopies`.
  external bool getRenderWorldCopies();

  /// Sets the state of `renderWorldCopies`.
  external MapboxMapJsImpl setRenderWorldCopies([bool? renderWorldCopies]);

  /// Returns a Point representing pixel coordinates.
  external PointJsImpl project(LngLatJsImpl lnglat);

  /// Returns a LngLat representing geographical coordinates.
  external LngLatJsImpl unproject(PointJsImpl point);

  /// Returns true if the map is panning, zooming, rotating, or pitching.
  external bool isMoving();

  /// Returns true if the map is zooming.
  external bool isZooming();

  /// Returns true if the map is rotating.
  external bool isRotating();

  /// Returns an array of GeoJSON Feature objects representing visible features.
  external JSArray<FeatureJsImpl> queryRenderedFeatures(JSAny? geometry,
      [JSAny? options]);

  /// Returns an array of GeoJSON Feature objects representing features within the specified source.
  external JSArray<JSAny?> querySourceFeatures(
      String sourceId, JSAny? parameters);

  /// Updates the map's Mapbox style object.
  external MapboxMapJsImpl setStyle(JSAny? style, [JSAny? options]);

  /// Returns the map's Mapbox style object.
  external JSAny? getStyle();

  /// Returns a Boolean indicating whether the map's style is fully loaded.
  external bool isStyleLoaded();

  /// Adds a source to the map's style.
  external MapboxMapJsImpl addSource(String id, JSAny? source);

  /// Returns a Boolean indicating whether the source is loaded.
  external bool isSourceLoaded(String id);

  /// Returns a Boolean indicating whether all tiles in the viewport are loaded.
  external bool areTilesLoaded();

  /// Adds a custom source type.
  external void addSourceType(
      String name, JSAny? sourceType, JSFunction callback);

  /// Removes a source from the map's style.
  external void removeSource(String id);

  /// Returns the source with the specified ID.
  external JSAny? getSource(String id);

  /// Add an image to the style.
  external void addImage(String id, JSAny? image, [JSAny? options]);

  /// Update an existing image in a style.
  external void updateImage(String id, JSAny? image);

  /// Check whether or not an image with a specific ID exists in the style.
  external bool hasImage(String id);

  /// Remove an image from a style.
  external void removeImage(String id);

  /// Load an image from an external URL.
  external void loadImage(String url, JSFunction callback);

  /// Returns an Array of strings containing the IDs of all images.
  external JSArray<JSString> listImages();

  /// Adds a Mapbox style layer to the map's style.
  external MapboxMapJsImpl addLayer(JSAny? layer, [String? beforeId]);

  /// Moves a layer to a different z-position.
  external MapboxMapJsImpl moveLayer(String id, String beforeId);

  /// Removes the layer with the given ID from the map's style.
  external void removeLayer(String id);

  /// Returns the layer with the specified ID.
  external JSAny? getLayer(String id);

  /// Sets the zoom extent for the specified style layer.
  external MapboxMapJsImpl setLayerZoomRange(
      String layerId, num minzoom, num maxzoom);

  /// Sets the filter for the specified style layer.
  external MapboxMapJsImpl setFilter(String layerId, JSAny? filter,
      [StyleSetterOptionsJsImpl? options]);

  /// Returns the filter applied to the specified style layer.
  external JSArray<JSAny?> getFilter(String layerId);

  /// Sets the value of a paint property.
  external void setPaintProperty(String layerId, String name, JSAny? value,
      [StyleSetterOptionsJsImpl? options]);

  /// Returns the value of a paint property.
  external JSAny? getPaintProperty(String layerId, String name);

  /// Sets the value of a layout property.
  external MapboxMapJsImpl setLayoutProperty(
      String layerId, String name, JSAny? value,
      [StyleSetterOptionsJsImpl? options]);

  /// Returns the value of a layout property.
  external JSAny? getLayoutProperty(String layerId, String name);

  /// Sets the any combination of light values.
  external MapboxMapJsImpl setLight(
      JSAny? light, StyleSetterOptionsJsImpl options);

  /// Returns the value of the light object.
  external JSAny? getLight();

  /// Sets the state of a feature.
  external void setFeatureState(JSAny? feature, JSAny? state);

  /// Removes feature state.
  external void removeFeatureState(JSAny? target, [String? key]);

  /// Gets the state of a feature.
  external JSAny? getFeatureState(JSAny? feature);

  /// Returns the map's containing HTML element.
  external web.HTMLElement getContainer();

  /// Returns the HTML element containing the map's canvas element.
  external web.HTMLElement getCanvasContainer();

  /// Returns the map's canvas element.
  external web.HTMLCanvasElement getCanvas();

  /// Returns a Boolean indicating whether the map is fully loaded.
  external bool loaded();

  /// Clean up and release all internal resources associated with this map.
  external void remove();

  /// Trigger the rendering of a single frame.
  external void triggerRepaint();

  /// Show tile boundaries for debugging.
  external bool get showTileBoundaries;
  external set showTileBoundaries(bool value);

  /// Show collision boxes for debugging.
  external bool get showCollisionBoxes;
  external set showCollisionBoxes(bool value);

  /// Show overdraw inspector for debugging.
  external bool get showOverdrawInspector;
  external set showOverdrawInspector(bool value);

  /// Enable continuous repaint for performance analysis.
  external bool get repaint;
  external set repaint(bool value);

  /// Show vertices.
  external bool get vertices;
  external set vertices(bool value);

  /// The version of Mapbox GL JS in use.
  external String get version;
}

@JS()
@anonymous
extension type MapOptionsJsImpl._(JSObject _) implements JSObject {
  external JSAny? get hash;
  external JSBoolean? get interactive;
  external JSAny? get container;
  external JSNumber? get bearingSnap;
  external JSBoolean? get pitchWithRotate;
  external JSNumber? get clickTolerance;
  external JSBoolean? get attributionControl;
  external JSAny? get customAttribution;
  external JSString? get logoPosition;
  external JSBoolean? get failIfMajorPerformanceCaveat;
  external JSBoolean? get preserveDrawingBuffer;
  external JSBoolean? get antialias;
  external JSBoolean? get refreshExpiredTiles;
  external LngLatBoundsJsImpl? get maxBounds;
  external JSBoolean? get scrollZoom;
  external JSNumber? get minZoom;
  external JSNumber? get maxZoom;
  external JSNumber? get minPitch;
  external JSNumber? get maxPitch;
  external JSAny? get style;
  external JSBoolean? get boxZoom;
  external JSBoolean? get dragRotate;
  external JSAny? get dragPan;
  external JSBoolean? get keyboard;
  external JSBoolean? get doubleClickZoom;
  external JSBoolean? get touchZoomRotate;
  external JSBoolean? get trackResize;
  external LngLatJsImpl? get center;
  external JSNumber? get zoom;
  external JSNumber? get bearing;
  external JSNumber? get pitch;
  external LngLatBoundsJsImpl? get bounds;
  external JSAny? get fitBoundsOptions;
  external JSBoolean? get renderWorldCopies;
  external JSNumber? get maxTileCacheSize;
  external JSString? get localIdeographFontFamily;
  external JSFunction? get transformRequest;
  external JSBoolean? get collectResourceTiming;
  external JSNumber? get fadeDuration;
  external JSBoolean? get crossSourceCollisions;
  external JSString? get accessToken;
  external JSAny? get locale;

  external factory MapOptionsJsImpl({
    JSAny? hash,
    JSBoolean? interactive,
    JSAny? container,
    JSNumber? bearingSnap,
    JSBoolean? pitchWithRotate,
    JSNumber? clickTolerance,
    JSBoolean? attributionControl,
    JSAny? customAttribution,
    JSString? logoPosition,
    JSBoolean? failIfMajorPerformanceCaveat,
    JSBoolean? preserveDrawingBuffer,
    JSBoolean? antialias,
    JSBoolean? refreshExpiredTiles,
    LngLatBoundsJsImpl? maxBounds,
    JSBoolean? scrollZoom,
    JSNumber? minZoom,
    JSNumber? maxZoom,
    JSNumber? minPitch,
    JSNumber? maxPitch,
    JSAny? style,
    JSBoolean? boxZoom,
    JSBoolean? dragRotate,
    JSAny? dragPan,
    JSBoolean? keyboard,
    JSBoolean? doubleClickZoom,
    JSBoolean? touchZoomRotate,
    JSBoolean? trackResize,
    LngLatJsImpl? center,
    JSNumber? zoom,
    JSNumber? bearing,
    JSNumber? pitch,
    LngLatBoundsJsImpl? bounds,
    JSAny? fitBoundsOptions,
    JSBoolean? renderWorldCopies,
    JSNumber? maxTileCacheSize,
    JSString? localIdeographFontFamily,
    JSFunction? transformRequest,
    JSBoolean? collectResourceTiming,
    JSNumber? fadeDuration,
    JSBoolean? crossSourceCollisions,
    JSString? accessToken,
    JSAny? locale,
  });
}

typedef RequestTransformFunctionJsImpl = RequestParametersJsImpl Function(
    String url, String resourceType);

@JS()
@anonymous
extension type RequestParametersJsImpl._(JSObject _) implements JSObject {
  external JSString? get url;
  external JSString? get credentials;
  external JSAny? get headers;
  external JSString? get method;
  external JSBoolean? get collectResourceTiming;

  external factory RequestParametersJsImpl({
    JSString? url,
    JSString? credentials,
    JSAny? headers,
    JSString? method,
    JSBoolean? collectResourceTiming,
  });
}

/// Interface for interactive controls added to the map.
@JS()
@anonymous
extension type IControlJsImpl._(JSObject _) implements JSObject {
  /// Register a control on the map.
  external web.HTMLElement onAdd(MapboxMapJsImpl map);

  /// Unregister a control on the map.
  external void onRemove(MapboxMapJsImpl map);

  /// Optionally provide a default position for this control.
  external String getDefaultPosition();
}
