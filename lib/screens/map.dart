import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_follow/services/geolocator_service.dart';

class Map extends StatefulWidget {
  final Position initialPosition;
  Map(this.initialPosition);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorService geoService = GeolocatorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.initialPosition.latitude,
                  widget.initialPosition.longitude),
              zoom: 100.0),
          mapType: MapType.satellite,
        zoomGesturesEnabled: true,
myLocationEnabled: true,
        ),
      ),
    );
  }
}
