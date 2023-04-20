import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'View/home_screen.dart';
import 'View/map_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => HomeScreen(),
        'map':(p0) => MapScreen(),
      },
    ),
  );
}
