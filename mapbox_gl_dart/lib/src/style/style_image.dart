library mapboxgl.style.style_image;

import 'dart:js_interop';

import 'package:mapbox_gl_dart/src/interop/interop.dart';

class StyleImage extends JsObjectWrapper<StyleImageJsImpl> {
  dynamic get data => jsObject.data;
  num get pixelRatio => jsObject.pixelRatio;
  bool get sdf => jsObject.sdf;
  num get version => jsObject.version;
  bool get hasRenderCallback => jsObject.hasRenderCallback;
  StyleImageInterface get userImage =>
      StyleImageInterface.fromJsObject(jsObject.userImage);

  /// Creates a new StyleImage from a [jsObject].
  StyleImage.fromJsObject(StyleImageJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

class StyleImageInterface extends JsObjectWrapper<StyleImageInterfaceJsImpl> {
  num get width => jsObject.width;
  num get height => jsObject.height;
  dynamic get data => jsObject.data;
  JSFunction? get render => jsObject.render;
  JSFunction? get onAdd => jsObject.onAdd;
  JSFunction? get onRemove => jsObject.onRemove;

  /// Creates a new StyleImageInterface from a [jsObject].
  StyleImageInterface.fromJsObject(StyleImageInterfaceJsImpl jsObject)
      : super.fromJsObject(jsObject);
}
