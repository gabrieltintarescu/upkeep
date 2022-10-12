import 'package:flutter/material.dart';
import 'package:upkeep_client/constants.dart';

import '../components/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(defaultPadding),
        child: Column(
          children: const [
            DashboardHeader(),
          ],
        ),
      ),
    );
  }
}
