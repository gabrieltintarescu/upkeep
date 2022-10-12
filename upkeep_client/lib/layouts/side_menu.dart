import 'package:flutter/material.dart';

import '../components/menu_drawer_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_profile.svg',
              onClick: () {},
              title: 'Profile',
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_dashbord.svg',
              onClick: () {},
              title: 'Dashboard',
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_tran.svg',
              onClick: () {},
              title: 'Transaction',
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_task.svg',
              onClick: () {},
              title: 'Task',
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_doc.svg',
              onClick: () {},
              title: 'Documents',
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_notification.svg',
              onClick: () {},
              title: 'Notification',
            ),
            MenuDrawerItem(
              iconPath: 'assets/icons/menu_setting.svg',
              onClick: () {},
              title: 'Settings',
            )
          ],
        ),
      ),
    );
  }
}
