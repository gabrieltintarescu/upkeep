import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void toggleMenu() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
