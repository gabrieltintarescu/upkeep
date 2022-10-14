import 'package:flutter/material.dart';

import '../models/user_response.dart';

class EditUserDialog extends StatelessWidget {
  final User user;
  const EditUserDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: 400,
        height: 250,
        child: Center(
            child: Text(
          user.name,
          style: const TextStyle(color: Colors.black),
        )),
      ),
    );
  }
}
