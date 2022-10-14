import 'package:flutter/material.dart';

import '../components/registered_users_table.dart';
import '../constants.dart';

class RegisteredUsersPanel extends StatelessWidget {
  const RegisteredUsersPanel({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Registered Users',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: defaultPadding),
          const RegisteredUsersTable()
        ],
      ),
    );
  }
}
