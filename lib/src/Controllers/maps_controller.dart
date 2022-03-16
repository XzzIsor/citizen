// ignore_for_file: unnecessary_getters_setters

import 'package:mapbox_gl/mapbox_gl.dart';

class MapController {
  MapboxMapController? _mapController;
  static LatLng _point = const LatLng(0, 0);

  void onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  MapboxMapController? get mapController => _mapController;

  set mapController(MapboxMapController? controller) {
    _mapController = controller;
  }

  LatLng get point {
    LatLng auxPoint = _point;
    _point = const LatLng(0,0);
    return auxPoint;
  }

  set point(LatLng mapPoint) {
    _point = mapPoint;
  }
}
