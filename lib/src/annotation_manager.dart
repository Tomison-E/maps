part of mapbox_gl;

abstract class AnnotationManager<T extends Annotation> {
  final MapboxMapController controller;
  final _idToAnnotation = <String, T>{};
  final _idToLayerIndex = <String, int>{};

  /// Called if a annotation is tapped
  final void Function(T)? onTap;

  /// base id of the manager. User [layerdIds] to get the actual ids.
  String get id => "${managerType}_$randomPostFix";

  final String managerType;

  final String randomPostFix;

  List<String> get layerIds =>
      [for (int i = 0; i < allLayerProperties.length; i++) _makeLayerId(i)];

  /// If disabled the manager offers no interaction for the created symbols
  final bool enableInteraction;

  /// implemented to define the layer properties
  List<LayerProperties> get allLayerProperties;

  /// used to spedicy the layer and annotation will life on
  /// This can be replaced by layer filters a soon as they are implemented
  final int Function(T)? selectLayer;

  /// get the an annotation by its id
  T? byId(String id) => _idToAnnotation[id];

  Set<T> get annotations => _idToAnnotation.values.toSet();

  AnnotationManager(
    this.controller, {
    required this.managerType,
    this.onTap,
    this.selectLayer,
    required this.enableInteraction,
  }) : randomPostFix = getRandomString() {
    for (var i = 0; i < allLayerProperties.length; i++) {
      final layerId = _makeLayerId(i);
      controller.addGeoJsonSource(layerId, buildFeatureCollection([]),
          promoteId: "id");
      controller.addLayer(layerId, layerId, allLayerProperties[i]);
    }

    if (onTap != null) {
      controller.onFeatureTapped.add(_onFeatureTapped);
    }
    controller.onFeatureDrag.add(_onDrag);
  }

  /// This function can be used to rebuild all layers after their properties
  /// changed
  Future<void> _rebuildLayers() async {
    for (var i = 0; i < allLayerProperties.length; i++) {
      final layerId = _makeLayerId(i);
      await controller.addLayer(layerId, layerId, allLayerProperties[i]);
    }
  }

  _onFeatureTapped(dynamic id, Point<double> point, LatLng coordinates) {
    final annotation = _idToAnnotation[id];
    if (annotation != null) {
      onTap!(annotation);
    }
  }

  String _makeLayerId(int layerIndex) => "${id}_$layerIndex";

  Future<void> _setAll() async {
    if (selectLayer != null) {
      final featureBuckets = [for (final _ in allLayerProperties) <T>[]];

      for (final annotation in _idToAnnotation.values) {
        final layerIndex = selectLayer!(annotation);
        _idToLayerIndex[annotation.id] = layerIndex;
        featureBuckets[layerIndex].add(annotation);
      }

      for (var i = 0; i < featureBuckets.length; i++) {
        await controller.setGeoJsonSource(
            _makeLayerId(i),
            buildFeatureCollection(
                [for (final l in featureBuckets[i]) l.toGeoJson()]));
      }
    } else {
      await controller.setGeoJsonSource(
          _makeLayerId(0),
          buildFeatureCollection(
              [for (final l in _idToAnnotation.values) l.toGeoJson()]));
    }
  }

  /// Adds a multiple annotations to the map. This much faster than calling add
  /// multiple times
  Future<void> addAll(Iterable<T> annotations) async {
    for (var a in annotations) {
      _idToAnnotation[a.id] = a;
    }
    await _setAll();
  }

  /// add a single annotation to the map
  Future<void> add(T annotation) async {
    _idToAnnotation[annotation.id] = annotation;
    await _setAll();
  }

  /// Removes multiple annotations from the map
  Future<void> removeAll(Iterable<T> annotations) async {
    for (var a in annotations) {
      _idToAnnotation.remove(a.id);
    }
    await _setAll();
  }

  /// Remove a single annotation form the map
  Future<void> remove(T annotation) async {
    _idToAnnotation.remove(annotation.id);
    await _setAll();
  }

  /// Removes all annotations from the map
  Future<void> clear() async {
    _idToAnnotation.clear();

    await _setAll();
  }

  /// Fully dipose of all the the resouces managed by the annotation manager.
  /// The manager cannot be used after this has been called
  Future<void> dispose() async {
    _idToAnnotation.clear();
    await _setAll();
    for (var i = 0; i < allLayerProperties.length; i++) {
      await controller.removeLayer(_makeLayerId(i));
      await controller.removeSource(_makeLayerId(i));
    }
  }

  _onDrag(dynamic id,
      {required Point<double> point,
      required LatLng origin,
      required LatLng current,
      required LatLng delta,
      required DragEventType eventType}) {
    final annotation = byId(id);
    if (annotation != null) {
      annotation.translate(delta);
      set(annotation);
    }
  }

  /// Set an existing anntotation to the map. Use this to do a fast update for a
  /// single annotation
  Future<void> set(T anntotation) async {
    assert(_idToAnnotation.containsKey(anntotation.id),
        "you can only set existing annotations");
    _idToAnnotation[anntotation.id] = anntotation;
    final oldLayerIndex = _idToLayerIndex[anntotation.id];
    final layerIndex = selectLayer != null ? selectLayer!(anntotation) : 0;
    if (oldLayerIndex != layerIndex) {
      // if the annotation has to be moved to another layer/source we have to
      // set all
      await _setAll();
    } else {
      await controller.setGeoJsonFeature(
          _makeLayerId(layerIndex), anntotation.toGeoJson());
    }
  }
}

class LineManager extends AnnotationManager<Line> {
  LineManager(MapboxMapController controller,
      {void Function(Line)? onTap, bool enableInteraction = true})
      : super(
          controller,
          managerType: "line",
          onTap: onTap,
          enableInteraction: enableInteraction,
          selectLayer: (Line line) => line.options.linePattern == null ? 0 : 1,
        );

  static const _baseProperties = LineLayerProperties(
    lineJoin: [Expressions.coalesce, [Expressions.get, 'lineJoin'], 'round'],
    lineOpacity: [Expressions.coalesce, [Expressions.get, 'lineOpacity'], 1.0],
    lineColor: [Expressions.coalesce, [Expressions.get, 'lineColor'], '#000000'],
    lineWidth: [Expressions.coalesce, [Expressions.get, 'lineWidth'], 1.0],
    lineGapWidth: [Expressions.coalesce, [Expressions.get, 'lineGapWidth'], 0.0],
    lineOffset: [Expressions.coalesce, [Expressions.get, 'lineOffset'], 0.0],
    lineBlur: [Expressions.coalesce, [Expressions.get, 'lineBlur'], 0.0],
  );
  @override
  List<LayerProperties> get allLayerProperties => [
        _baseProperties,
        _baseProperties.copyWith(
            LineLayerProperties(linePattern: [Expressions.get, 'linePattern'])),
      ];
}

class FillManager extends AnnotationManager<Fill> {
  FillManager(
    MapboxMapController controller, {
    void Function(Fill)? onTap,
    bool enableInteraction = true,
  }) : super(
          controller,
          managerType: "fill",
          onTap: onTap,
          enableInteraction: enableInteraction,
          selectLayer: (Fill fill) => fill.options.fillPattern == null ? 0 : 1,
        );
  @override
  List<LayerProperties> get allLayerProperties => const [
        FillLayerProperties(
          fillOpacity: [Expressions.coalesce, [Expressions.get, 'fillOpacity'], 1.0],
          fillColor: [Expressions.coalesce, [Expressions.get, 'fillColor'], '#000000'],
          fillOutlineColor: [Expressions.get, 'fillOutlineColor'],
        ),
        FillLayerProperties(
          fillOpacity: [Expressions.coalesce, [Expressions.get, 'fillOpacity'], 1.0],
          fillColor: [Expressions.coalesce, [Expressions.get, 'fillColor'], '#000000'],
          fillOutlineColor: [Expressions.get, 'fillOutlineColor'],
          fillPattern: [Expressions.get, 'fillPattern'],
        )
      ];
}

class CircleManager extends AnnotationManager<Circle> {
  CircleManager(
    MapboxMapController controller, {
    void Function(Circle)? onTap,
    bool enableInteraction = true,
  }) : super(
          controller,
          managerType: "circle",
          enableInteraction: enableInteraction,
          onTap: onTap,
        );
  @override
  List<LayerProperties> get allLayerProperties => const [
        CircleLayerProperties(
          circleRadius: [Expressions.coalesce, [Expressions.get, 'circleRadius'], 5.0],
          circleColor: [Expressions.coalesce, [Expressions.get, 'circleColor'], '#000000'],
          circleBlur: [Expressions.coalesce, [Expressions.get, 'circleBlur'], 0.0],
          circleOpacity: [Expressions.coalesce, [Expressions.get, 'circleOpacity'], 1.0],
          circleStrokeWidth: [Expressions.coalesce, [Expressions.get, 'circleStrokeWidth'], 0.0],
          circleStrokeColor: [Expressions.coalesce, [Expressions.get, 'circleStrokeColor'], '#000000'],
          circleStrokeOpacity: [Expressions.coalesce, [Expressions.get, 'circleStrokeOpacity'], 1.0],
        )
      ];
}

class SymbolManager extends AnnotationManager<Symbol> {
  SymbolManager(
    MapboxMapController controller, {
    void Function(Symbol)? onTap,
    bool iconAllowOverlap = false,
    bool textAllowOverlap = false,
    bool iconIgnorePlacement = false,
    bool textIgnorePlacement = false,
    bool enableInteraction = true,
  })  : _iconAllowOverlap = iconAllowOverlap,
        _textAllowOverlap = textAllowOverlap,
        _iconIgnorePlacement = iconIgnorePlacement,
        _textIgnorePlacement = textIgnorePlacement,
        super(
          controller,
          managerType: "symbol",
          enableInteraction: enableInteraction,
          onTap: onTap,
        );

  bool _iconAllowOverlap;
  bool _textAllowOverlap;
  bool _iconIgnorePlacement;
  bool _textIgnorePlacement;

  /// For more information on what this does, see https://docs.mapbox.com/help/troubleshooting/optimize-map-label-placement/#label-collision
  Future<void> setIconAllowOverlap(bool value) async {
    _iconAllowOverlap = value;
    await _rebuildLayers();
  }

  /// For more information on what this does, see https://docs.mapbox.com/help/troubleshooting/optimize-map-label-placement/#label-collision
  Future<void> setTextAllowOverlap(bool value) async {
    _textAllowOverlap = value;
    await _rebuildLayers();
  }

  /// For more information on what this does, see https://docs.mapbox.com/help/troubleshooting/optimize-map-label-placement/#label-collision
  Future<void> setIconIgnorePlacement(bool value) async {
    _iconIgnorePlacement = value;
    await _rebuildLayers();
  }

  /// For more information on what this does, see https://docs.mapbox.com/help/troubleshooting/optimize-map-label-placement/#label-collision
  Future<void> setTextIgnorePlacement(bool value) async {
    _textIgnorePlacement = value;
    await _rebuildLayers();
  }

  @override
  List<LayerProperties> get allLayerProperties => [
        SymbolLayerProperties(
          iconSize: [Expressions.coalesce, [Expressions.get, 'iconSize'], 1.0],
          iconImage: [Expressions.get, 'iconImage'],
          iconRotate: [Expressions.coalesce, [Expressions.get, 'iconRotate'], 0.0],
          iconOffset: [Expressions.coalesce, [Expressions.get, 'iconOffset'], [Expressions.literal, [0.0, 0.0]]],
          iconAnchor: [Expressions.coalesce, [Expressions.get, 'iconAnchor'], 'center'],
          iconOpacity: [Expressions.coalesce, [Expressions.get, 'iconOpacity'], 1.0],
          iconColor: [Expressions.coalesce, [Expressions.get, 'iconColor'], '#000000'],
          iconHaloColor: [Expressions.coalesce, [Expressions.get, 'iconHaloColor'], 'rgba(0,0,0,0)'],
          iconHaloWidth: [Expressions.coalesce, [Expressions.get, 'iconHaloWidth'], 0.0],
          iconHaloBlur: [Expressions.coalesce, [Expressions.get, 'iconHaloBlur'], 0.0],
          // note that web does not support setting this in a fully data driven
          // way this is a upstream issue
          textFont: kIsWeb
              ? null
              : [
                  Expressions.caseExpression,
                  [Expressions.has, 'fontNames'],
                  [Expressions.get, 'fontNames'],
                  [
                    Expressions.literal,
                    ["Open Sans Regular", "Arial Unicode MS Regular"]
                  ],
                ],
          textField: [Expressions.get, 'textField'],
          textSize: [Expressions.coalesce, [Expressions.get, 'textSize'], 16.0],
          textMaxWidth: [Expressions.coalesce, [Expressions.get, 'textMaxWidth'], 10.0],
          textLetterSpacing: [Expressions.coalesce, [Expressions.get, 'textLetterSpacing'], 0.0],
          textJustify: [Expressions.coalesce, [Expressions.get, 'textJustify'], 'center'],
          textAnchor: [Expressions.coalesce, [Expressions.get, 'textAnchor'], 'center'],
          textRotate: [Expressions.coalesce, [Expressions.get, 'textRotate'], 0.0],
          textTransform: [Expressions.coalesce, [Expressions.get, 'textTransform'], 'none'],
          textOffset: [Expressions.coalesce, [Expressions.get, 'textOffset'], [Expressions.literal, [0.0, 0.0]]],
          textOpacity: [Expressions.coalesce, [Expressions.get, 'textOpacity'], 1.0],
          textColor: [Expressions.coalesce, [Expressions.get, 'textColor'], '#000000'],
          textHaloColor: [Expressions.coalesce, [Expressions.get, 'textHaloColor'], 'rgba(0,0,0,0)'],
          textHaloWidth: [Expressions.coalesce, [Expressions.get, 'textHaloWidth'], 0.0],
          textHaloBlur: [Expressions.coalesce, [Expressions.get, 'textHaloBlur'], 0.0],
          symbolSortKey: [Expressions.coalesce, [Expressions.get, 'zIndex'], 0],
          iconAllowOverlap: _iconAllowOverlap,
          iconIgnorePlacement: _iconIgnorePlacement,
          textAllowOverlap: _textAllowOverlap,
          textIgnorePlacement: _textIgnorePlacement,
        )
      ];
}
