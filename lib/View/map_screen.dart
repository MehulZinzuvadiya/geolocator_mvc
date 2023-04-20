import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controller/location_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LocationController locationController = Get.put(
    LocationController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Current Location"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  locationController.lat.value, locationController.lan.value),
            ),
            markers: {
              Marker(
                  draggable: true,
                  markerId: const MarkerId("Mehul"),
                  position: LatLng(locationController.lat.value,
                      locationController.lan.value))
            },
          )
        ],
      ),
    ));
  }
}
