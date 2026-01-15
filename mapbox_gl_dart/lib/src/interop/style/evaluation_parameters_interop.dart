import 'dart:js_interop';

@JS('mapboxgl.EvaluationParameters')
extension type EvaluationParametersJsImpl._(JSObject _) implements JSObject {
  external num get zoom;
  external num get now;
  external num get fadeDuration;
  external JSAny? get zoomHistory;
  external JSAny? get transition;

  external factory EvaluationParametersJsImpl(num zoom, [JSAny? options]);

  external bool isSupportedScript(String str);

  external num crossFadingFactor();

  external JSAny? getCrossfadeParameters();
}
