import 'package:flutter/material.dart';
import 'package:upkeep_client/responsive.dart';

import '../constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile_pic_man2.png',
            height: 33,
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text('Gabriel Tintarescu'),
            ),
          const Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
