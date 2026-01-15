library mapboxgl.ui.handler.box_zoom;

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart' as web;

class BoxZoomHandler extends JsObjectWrapper<BoxZoomHandlerJsImpl> {
  ///  Returns a Boolean indicating whether the "box zoom" interaction is enabled.
  ///
  ///  @returns {boolean} `true` if the "box zoom" interaction is enabled.
  bool isEnabled() => jsObject.isEnabled();

  ///  Returns a Boolean indicating whether the "box zoom" interaction is active, i.e. currently being used.
  ///
  ///  @returns {boolean} `true` if the "box zoom" interaction is active.
  bool isActive() => jsObject.isActive();

  ///  Enables the "box zoom" interaction.
  ///
  ///  @example
  ///    map.boxZoom.enable();
  enable() => jsObject.enable();

  ///  Disables the "box zoom" interaction.
  ///
  ///  @example
  ///    map.boxZoom.disable();
  disable() => jsObject.disable();

  onMouseDown(web.MouseEvent e) => jsObject.onMouseDown(e);

  /// Creates a new BoxZoomHandler from a [jsObject].
  BoxZoomHandler.fromJsObject(BoxZoomHandlerJsImpl jsObject)
      : super.fromJsObject(jsObject);
}
