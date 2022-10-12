import 'package:flutter/material.dart';
import 'package:upkeep_client/layouts/dashboard_screen.dart';

import '../layouts/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5, // Main area takes 5/6 of screen width
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
