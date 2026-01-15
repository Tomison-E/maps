import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:mapbox_gl_dart/mapbox_gl_dart.dart';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

typedef Listener = dynamic Function(Event object);
typedef GeoListener = dynamic Function(dynamic object);

class Event extends JsObjectWrapper<EventJsImpl> {
  String get id => jsObject.id;
  String get type => jsObject.type;
  LngLat get lngLat => LngLat.fromJsObject(jsObject.lngLat);
  List<Feature> get features =>
      jsObject.features.toDart.map((f) => Feature.fromJsObject(f)).toList();
  Point get point => Point.fromJsObject(jsObject.point);

  factory Event({
    String? id,
    String? type,
    required LngLat lngLat,
    required List<Feature> features,
    required Point point,
  }) =>
      Event.fromJsObject(EventJsImpl(
        id: id,
        type: type,
        lngLat: lngLat.jsObject,
        features: features.map((f) => f.jsObject).toList().toJS,
        point: point.jsObject,
      ));

  void preventDefault() => jsObject.preventDefault();

  /// Creates a new Event from a [jsObject].
  Event.fromJsObject(super.jsObject) : super.fromJsObject();
}

class Evented extends JsObjectWrapper<EventedJsImpl> {
  /// Adds a listener to a specified event type.
  ///
  /// @param {string} type The event type to add a listen for.
  /// @param {Function} listener The function to be called when the event is fired.
  ///   The listener function is called with the data object passed to `fire`,
  ///   extended with `target` and `type` properties.
  /// @returns {Object} `this`
  MapboxMap on(String type, [dynamic layerIdOrListener, Listener? listener]) {
    // Handle GeolocateControl specially
    if (this is GeolocateControl && layerIdOrListener is GeoListener) {
      return MapboxMap.fromJsObject(
        jsObject.on(
            type,
            ((JSAny? position) {
              layerIdOrListener(position);
            }).toJS),
      );
    }

    // If layerIdOrListener is a Function (any function), treat it as a listener
    if (layerIdOrListener is Function) {
      final jsCallback = ((JSAny? jsEvent) {
        try {
          final event = Event.fromJsObject(jsEvent as EventJsImpl);
          layerIdOrListener(event);
        } catch (e) {
          print('Error in event callback for $type: $e');
        }
      }).toJS;
      // Use callMethod for more reliable JS interop
      final result = (jsObject as JSObject).callMethod('on'.toJS, type.toJS, jsCallback);
      return MapboxMap.fromJsObject(result as MapboxMapJsImpl);
    }

    // layerIdOrListener is a layer ID string, listener is the callback
    if (listener != null) {
      final jsCallback = ((JSAny? jsEvent) {
        try {
          final event = Event.fromJsObject(jsEvent as EventJsImpl);
          listener(event);
        } catch (e) {
          print('Error in layer event callback for $type: $e');
        }
      }).toJS;
      return MapboxMap.fromJsObject(
          jsObject.on(type, (layerIdOrListener as String).toJS, jsCallback));
    }

    // Fallback - shouldn't reach here normally
    print('Warning: on() called with unexpected arguments for $type');
    return MapboxMap.fromJsObject(jsObject as MapboxMapJsImpl);
  }

  /// Removes a previously registered event listener.
  ///
  /// @param {string} type The event type to remove listeners for.
  /// @param {Function} listener The listener function to remove.
  /// @returns {Object} `this`
  MapboxMap off(String type, [dynamic layerIdOrListener, Listener? listener]) {
    // If layerIdOrListener is a Function, treat it as a listener
    if (layerIdOrListener is Function) {
      final jsCallback = ((JSAny? jsEvent) {
        try {
          final event = Event.fromJsObject(jsEvent as EventJsImpl);
          layerIdOrListener(event);
        } catch (e) {
          print('Error in off callback for $type: $e');
        }
      }).toJS;
      return MapboxMap.fromJsObject(jsObject.off(type, jsCallback));
    }

    // layerIdOrListener is a layer ID string, listener is the callback
    if (listener != null) {
      final jsCallback = ((JSAny? jsEvent) {
        try {
          final event = Event.fromJsObject(jsEvent as EventJsImpl);
          listener(event);
        } catch (e) {
          print('Error in off layer callback for $type: $e');
        }
      }).toJS;
      return MapboxMap.fromJsObject(
          jsObject.off(type, (layerIdOrListener as String).toJS, jsCallback));
    }

    return MapboxMap.fromJsObject(jsObject as MapboxMapJsImpl);
  }

  /// Adds a listener that will be called only once to a specified event type.
  ///
  /// The listener will be called first time the event fires after the listener is registered.
  ///
  /// @param {string} type The event type to listen for.
  /// @param {Function} listener The function to be called when the event is fired the first time.
  /// @returns {Object} `this`
  MapboxMap once(String type, dynamic listener) {
    final jsCallback = ((JSAny? jsEvent) {
      try {
        final event = Event.fromJsObject(jsEvent as EventJsImpl);
        listener(event);
      } catch (e) {
        print('Error in once callback for $type: $e');
      }
    }).toJS;
    return MapboxMap.fromJsObject(jsObject.once(type, jsCallback));
  }

  void fire(Event event, [dynamic properties]) =>
      jsObject.fire(event.jsObject, properties as JSAny?);

  /// Returns a true if this instance of Evented or any forwardeed instances of Evented have a listener for the specified type.
  ///
  /// @param {string} type The event type
  /// @returns {boolean} `true` if there is at least one registered listener for specified event type, `false` otherwise
  /// @private
  bool listens(String type) => jsObject.listens(type);

  /// Bubble all events fired by this instance of Evented to this parent instance of Evented.
  ///
  /// @private
  /// @returns {Object} `this`
  /// @private
  void setEventedParent([Evented? parent, dynamic data]) =>
      jsObject.setEventedParent(parent?.jsObject, data as JSAny?);

  /// Creates a new Evented from a [jsObject].
  Evented.fromJsObject(super.jsObject) : super.fromJsObject();
}
