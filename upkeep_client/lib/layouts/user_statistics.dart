import 'package:flutter/material.dart';
import 'package:upkeep_client/components/chart_info_card.dart';
import 'package:upkeep_client/components/dashboard_chart.dart';

import '../constants.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'User Statistics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          DashboardChart(),
          ChartInfoCard(
            title: 'Regular Access',
            usersNumber: '90.9K',
            iconPath: 'assets/icons/Documents.svg',
            percent: 72,
          ),
          ChartInfoCard(
            title: 'Moderators',
            usersNumber: '22.1K',
            iconPath: 'assets/icons/folder.svg',
            percent: 18,
          ),
          ChartInfoCard(
            title: 'Administrators',
            usersNumber: '8.2K',
            iconPath: 'assets/icons/unknown.svg',
            percent: 10,
          ),
        ],
      ),
    );
  }
}
