import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:citizen/src/Controllers/controllers.dart';
import 'package:citizen/src/Controllers/maps_controller.dart';
import 'package:citizen/src/Models/models.dart';

class MapBoxWeb extends StatefulWidget {
  const MapBoxWeb(
      {Key? key,
      this.problem,
      required this.height,
      required this.width,
      this.problemList,
      this.fixedProblem})
      : super(key: key);
  final ProblemModel? problem;
  final ProblemModel? fixedProblem;
  final List<ProblemModel>? problemList;
  final double height;
  final double width;

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
    bool isOnePoint;
    GeoPoint _point;
    if (widget.problem != null) {
      isOnePoint = true;
      _point = widget.problem!.ubicacion;
    } else {
      isOnePoint = false;
      _point = widget.fixedProblem!.ubicacion;
    }

    MapboxMap _map = MapboxMap(
      accessToken:
          'pk.eyJ1IjoieHNzaXNvciIsImEiOiJjbDBzY3p3M2owMWduM2pueXF6amU3MmU5In0.rFLM212RMk8t6hhWxG_RBQ',
      onMapCreated: _mapController.onMapCreated,
      onStyleLoadedCallback: () => isOnePoint ? _addCircle(_mapController.mapController!, _point): _addListCircles(_mapController.mapController!, widget.problemList!),
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
        child: _map
        );
  }

  void _addCircle(MapboxMapController controller, GeoPoint point) {
    controller.addCircle(CircleOptions(
        geometry: LatLng(point.latitude, point.longitude),
        circleColor: '#ff8fbb',
        circleRadius: 8));
  }

  void _addListCircles(MapboxMapController controller, List<ProblemModel> problems) {
    for (var problem in problems) {
      LatLng point = LatLng(problem.ubicacion.latitude, problem.ubicacion.longitude);
        controller.addCircle(CircleOptions(
        geometry: LatLng(point.latitude, point.longitude),
        circleColor: '#ff8fbb',
        circleRadius: 8
        
        ));
    }
  }
}
