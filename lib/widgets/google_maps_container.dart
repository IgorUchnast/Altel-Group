import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsContainer extends StatefulWidget {
  const GoogleMapsContainer({super.key});

  @override
  State<GoogleMapsContainer> createState() => GoogleMapsContainerState();
}

class GoogleMapsContainerState extends State<GoogleMapsContainer> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Ustawienie początkowej pozycji kamery na współrzędnych Google Plex
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.3029637, 19.1372036),
    zoom: 18,
  );

  // Zmiana pozycji kamery na lokalizację Małobądzka 143, 42-500 Będzin
  static const CameraPosition _kLocation = CameraPosition(
    target: LatLng(
      50.3029637,
      19.1372036,
    ), // współrzędne dla Małobądzka 143, Będzin
    zoom: 16.0,
  );

  // Marker dla lokalizacji Małobądzka 143
  final Marker _marker = Marker(
    markerId: const MarkerId('Mylocation'),
    position: const LatLng(50.3029637, 19.1372036), // współrzędne Będzina
    infoWindow: const InfoWindow(
      title: 'Altel Group sp. z o.o.\nMałobądzka 143, Będzin',
    ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: FloatingActionButton.extended(
          onPressed: _goToLocation,
          label: const Text('Altel Group sp. z o.o.'),
          icon: const Icon(Icons.location_pin),
        ),
      ),
    );
  }

  // Funkcja przenosząca kamerę na lokalizację Małobądzka 143
  Future<void> _goToLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLocation));
  }
}
