import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter/material.dart';

import 'package:citizen/src/Controllers/controllers.dart';

class MapRegisterProblem extends StatefulWidget {
  const MapRegisterProblem({Key? key}) : super(key: key);

  @override
  State<MapRegisterProblem> createState() => _MapRegisterProblemState();
}

class _MapRegisterProblemState extends State<MapRegisterProblem> {
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

    MapboxMap _map = MapboxMap(
      accessToken:
          'pk.eyJ1IjoieHNzaXNvciIsImEiOiJjbDBzY3p3M2owMWduM2pueXF6amU3MmU5In0.rFLM212RMk8t6hhWxG_RBQ',
      onMapCreated: _mapController.onMapCreated,
      initialCameraPosition:
          const CameraPosition(target: LatLng(2.451661, -76.599023), zoom: 12),
      onMapClick: (point, latLng) {
        _addCircle(_mapController.mapController!, latLng);
        _mapController.point = latLng;
      },
    );

    return Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(7, 7))
        ]),
        margin: EdgeInsets.only(top: _size.height * 0.12),
        height: _size.height*0.3,
        width: _size.width*0.20,
        child: _map);
  }

  void _addCircle(MapboxMapController controller, LatLng point) {
    controller.addCircle(CircleOptions(
        geometry: point, circleColor: '#ff8fbb', circleRadius: 8));
  }
}
