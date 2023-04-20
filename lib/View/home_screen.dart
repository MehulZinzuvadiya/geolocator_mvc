import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_mvc/Controller/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationController locationController = Get.put(LocationController());

  @override
  void initState() {
    super.initState();
    locationController.permission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Find Me"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    locationController.lan.value = position.longitude;
                    locationController.lat.value = position.latitude;
                  },
                  child: const Text("Locate")),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Text(
                    "Lat=${locationController.lat}",
                    style: GoogleFonts.lato(fontSize: 24),
                  )),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  "Lan=${locationController.lan}",
                  style: GoogleFonts.lato(fontSize: 24),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    List<Placemark> placemarkList =
                        await placemarkFromCoordinates(
                            locationController.lat.value,
                            locationController.lan.value);
                    placemarkList.isEmpty
                        ? "null"
                        : locationController.placeList.value = placemarkList;
                  },
                  child: Text(
                    "Address",
                    style: GoogleFonts.lato(fontSize: 20),
                  )),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text("${locationController.placeList[0]}")),
              SizedBox(height: 20,),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Get.toNamed('map');
                  },
                  child: const Text("Go On Map"))
            ],
          ),
        ),
      ),
    ));
  }
}
