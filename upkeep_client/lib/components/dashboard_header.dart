import 'package:flutter/material.dart';
import 'package:upkeep_client/components/profile_card.dart';
import 'package:upkeep_client/components/search_field.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(flex: 2),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}
