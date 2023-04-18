import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'View/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => HomeScreen(),
      },
    ),
  );
}
