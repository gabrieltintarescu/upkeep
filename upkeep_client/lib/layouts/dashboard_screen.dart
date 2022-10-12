import 'package:flutter/material.dart';
import 'package:upkeep_client/constants.dart';

import 'dashboard_header.dart';
import 'user_statistics.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(defaultPadding),
        child: Column(
          children: [
            const DashboardHeader(),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: defaultPadding),
                const Expanded(
                  flex: 2,
                  child: UserStatistics(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
