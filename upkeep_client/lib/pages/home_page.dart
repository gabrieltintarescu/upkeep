import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upkeep_client/controllers/dashboard_controller.dart';
import 'package:upkeep_client/layouts/dashboard_screen.dart';
import 'package:upkeep_client/responsive.dart';

import '../layouts/side_menu.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  DashboardController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Showing open drawer only for desktop or larger screens
            if (Responsive.isDesktop(context))
              Expanded(
                child: Entry(
                  xOffset: -800,
                  delay: const Duration(milliseconds: 700),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.ease,
                  child: const SideMenu(),
                ),
              ),
            const Expanded(
              flex: 5, // Main area takes 5/6 of screen width
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
