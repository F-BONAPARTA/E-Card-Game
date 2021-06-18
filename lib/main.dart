import 'package:e_cards/controllers/singel_mode_controller.dart';
import 'package:e_cards/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/single_mode_screen.dart';

void main() {
  Get.put(SingelModeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
