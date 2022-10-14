import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upkeep_client/components/users_chart.dart';
import 'package:upkeep_client/controllers/dashboard_controller.dart';

import '../constants.dart';

class UsersPanel extends StatelessWidget {
  const UsersPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active Users',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding,
                ),
              ),
              onPressed: () => controller.openAddUser(),
              icon: const Icon(Icons.add),
              label: const Text('Add New'),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        UsersChart(),
      ],
    );
  }
}
