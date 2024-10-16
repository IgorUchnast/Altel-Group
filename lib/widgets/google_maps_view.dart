import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Ustawienie początkowej pozycji kamery na współrzędnych Google Plex
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.3029637, 19.1372036),
    zoom: 20,
  );

  // Zmiana pozycji kamery na lokalizację Małobądzka 143, 42-500 Będzin
  static const CameraPosition _kLocation = CameraPosition(
    target:
        LatLng(50.334092, 19.137764), // współrzędne dla Małobądzka 143, Będzin
    zoom: 16.0,
  );

  // Marker dla lokalizacji Małobądzka 143
  final Marker _marker = Marker(
    markerId: MarkerId('Mylocation'),
    position: LatLng(50.3029637, 19.1372036), // współrzędne Będzina
    infoWindow: InfoWindow(title: 'Małobądzka 143, Będzin'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed), // czerwony marker
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal, // domyślny typ mapy
        initialCameraPosition: _kGooglePlex,
        markers: {_marker}, // dodanie markera
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToLocation,
      //   label: const Text('Go to location!'),
      //   icon: const Icon(Icons.location_pin),
      // ),
    );
  }

  // Funkcja przenosząca kamerę na lokalizację Małobądzka 143
  Future<void> _goToLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLocation));
  }
}
