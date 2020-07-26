import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_follow/services/geolocator_service.dart';
import 'package:provider/provider.dart';
import './screens/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final geoService = GeolocatorService();

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialLocation(),
      child: MaterialApp(
        title: 'Map Follow',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<Position>(
          builder: (context, position, widget) {
            return (position !=null) ? Map(position) :Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
