import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upkeep_client/components/profile_card.dart';
import 'package:upkeep_client/components/search_field.dart';

import '../controllers/homepage_controller.dart';
import '../responsive.dart';

class DashboardHeader extends GetView<HomepageController> {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => controller.toggleMenu(),
              icon: const Icon(Icons.menu),
            ),
          ),
        if (!Responsive.isMobile(context))
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}
