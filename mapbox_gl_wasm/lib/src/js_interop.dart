part of mapbox_gl_wasm;

/// JavaScript interop bindings for WASM-compatible Mapbox GL JS integration
@JS()
external JSObject get window;

@JS()
external JSObject get document;

/// Creates a DOM element using JavaScript interop
@JS('document.createElement')
external JSObject createElement(String tagName);

/// Gets an element by ID
@JS('document.getElementById')
external JSObject? getElementById(String id);

/// Creates a text node
@JS('document.createTextNode')
external JSObject createTextNode(String text);

/// Gets querySelector
@JS('document.querySelector')
external JSObject? querySelector(String selector);

/// Helper extension for JSObject to work with DOM elements
extension JSObjectElementExtension on JSObject {
  /// Sets a style property
  void setStyle(String property, String value) {
    final style = getProperty('style'.toJS) as JSObject?;
    if (style != null) {
      style.setProperty(property.toJS, value.toJS);
    }
  }

  /// Gets a style property
  String? getStyle(String property) {
    final style = getProperty('style'.toJS) as JSObject?;
    if (style != null) {
      return (style.getProperty(property.toJS) as JSString?)?.toDart;
    }
    return null;
  }

  /// Appends a child element
  void appendChild(JSObject child) {
    callMethod('appendChild'.toJS, child);
  }

  /// Removes a child element
  void removeChild(JSObject child) {
    callMethod('removeChild'.toJS, child);
  }

  /// Sets an attribute
  void setAttribute(String name, String value) {
    callMethod('setAttribute'.toJS, name.toJS, value.toJS);
  }

  /// Gets an attribute
  String? getAttribute(String name) {
    final result = callMethod('getAttribute'.toJS, name.toJS);
    return (result as JSString?)?.toDart;
  }

  /// Adds an event listener
  void addEventListener(String type, JSFunction listener, [bool? useCapture]) {
    if (useCapture != null) {
      callMethod('addEventListener'.toJS, type.toJS, listener, useCapture.toJS);
    } else {
      callMethod('addEventListener'.toJS, type.toJS, listener);
    }
  }

  /// Removes an event listener
  void removeEventListener(String type, JSFunction listener, [bool? useCapture]) {
    if (useCapture != null) {
      callMethod('removeEventListener'.toJS, type.toJS, listener, useCapture.toJS);
    } else {
      callMethod('removeEventListener'.toJS, type.toJS, listener);
    }
  }

  /// Gets the client width
  int get clientWidth => (getProperty('clientWidth'.toJS) as JSNumber?)?.toDartInt ?? 0;

  /// Gets the client height
  int get clientHeight => (getProperty('clientHeight'.toJS) as JSNumber?)?.toDartInt ?? 0;
}

/// Helper to create a link element for stylesheets
JSObject createStylesheetLink(String href) {
  final link = createElement('link');
  link.setAttribute('rel', 'stylesheet');
  link.setAttribute('href', href);
  return link;
}

/// Helper to load a stylesheet and wait for it to load
Future<void> loadStylesheet(JSObject parent, String href) async {
  final link = createStylesheetLink(href);
  final completer = Completer<void>();
  
  final onLoad = ((JSObject event) {
    completer.complete();
  }).toJS;
  
  link.addEventListener('load', onLoad);
  parent.appendChild(link);
  
  return completer.future;
}

/// ResizeObserver for WASM compatibility
@JS('ResizeObserver')
class ResizeObserver {
  external factory ResizeObserver(JSFunction callback);
  external void observe(JSObject target);
  external void unobserve(JSObject target);
  external void disconnect();
}

