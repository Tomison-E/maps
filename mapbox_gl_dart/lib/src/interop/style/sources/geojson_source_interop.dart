import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type GeoJsonSourceJsImpl._(JSObject _) implements JSObject {
  external FeatureCollectionJsImpl get data;
  external String? get promoteId;

  external factory GeoJsonSourceJsImpl({
    String? type,
    String? promoteId,
    FeatureCollectionJsImpl? data,
  });

  external GeoJsonSourceJsImpl setData(FeatureCollectionJsImpl featureCollection);
}
