import 'package:flutter/material.dart';
import 'package:upkeep_client/constants.dart';
import 'package:upkeep_client/layouts/registered_users_panel.dart';
import 'package:upkeep_client/responsive.dart';

import '../components/users_panel.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      if (Responsive.isMobile(context)) const UserStatistics(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      const UsersPanel(),
                      const SizedBox(height: defaultPadding),
                      const RegisteredUsersPanel(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
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
