library mapboxgl.ui.handler.drag_pan;

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart' as web;

class DragPanHandler extends JsObjectWrapper<DragPanHandlerJsImpl> {
  ///  Returns a Boolean indicating whether the "drag to pan" interaction is enabled.
  ///
  ///  @returns {boolean} `true` if the "drag to pan" interaction is enabled.
  bool isEnabled() => jsObject.isEnabled();

  ///  Returns a Boolean indicating whether the "drag to pan" interaction is active, i.e. currently being used.
  ///
  ///  @returns {boolean} `true` if the "drag to pan" interaction is active.
  bool isActive() => jsObject.isActive();

  ///  Enables the "drag to pan" interaction.
  ///
  ///  @example
  ///  map.dragPan.enable();
  enable() => jsObject.enable();

  ///  Disables the "drag to pan" interaction.
  ///
  ///  @example
  ///  map.dragPan.disable();
  disable() => jsObject.disable();

  onMouseDown(web.MouseEvent e) => jsObject.onMouseDown(e);

  onTouchStart(web.TouchEvent e) => jsObject.onTouchStart(e);

  /// Creates a new DragPanHandler from a [jsObject].
  DragPanHandler.fromJsObject(DragPanHandlerJsImpl jsObject)
      : super.fromJsObject(jsObject);
}
