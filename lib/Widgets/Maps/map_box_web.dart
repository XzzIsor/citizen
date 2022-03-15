import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Controllers/maps_controller.dart';
import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxWeb extends StatefulWidget {
  MapBoxWeb({Key? key, required this.problem, required this.height, required this.width}) : super(key: key);
  ProblemModel problem;
  double height;
  double width;

  @override
  State<MapBoxWeb> createState() => _MapBoxWebState();
}

class _MapBoxWebState extends State<MapBoxWeb> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.mapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    GeoPoint _point = widget.problem.ubicacion;

    MapboxMap _map = MapboxMap(
      accessToken:
          'pk.eyJ1IjoieHNzaXNvciIsImEiOiJjbDBzY3p3M2owMWduM2pueXF6amU3MmU5In0.rFLM212RMk8t6hhWxG_RBQ',
      onMapCreated: _mapController.onMapCreated,
      onStyleLoadedCallback: () =>
          _addCircle(_mapController.mapController!, _point),
      initialCameraPosition: CameraPosition(
          target: LatLng(_point.latitude, _point.longitude), zoom: 14),
    );

    return Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(7, 7))
        ]),
        height: widget.height,
        width: widget.width,
        child: _map);
  }

  void _addCircle(MapboxMapController controller, GeoPoint point) {
    controller.addCircle(CircleOptions(
        geometry: LatLng(point.latitude, point.longitude),
        circleColor: '#ff8fbb',
        circleRadius: 10));
  }
}
