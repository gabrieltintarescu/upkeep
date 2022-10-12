import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuDrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final String iconPath;
  const MenuDrawerItem({
    Key? key,
    required this.title,
    required this.onClick,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: SvgPicture.asset(
        iconPath,
        height: 16,
        color: Colors.white70,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
