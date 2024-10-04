import 'package:flutter/material.dart';

class TabBarIcon extends StatelessWidget {
  const TabBarIcon({super.key, required this.unselectedIcon, required this.selectedIcon, required this.iconSelected});
final bool iconSelected;
final IconData unselectedIcon;
final IconData selectedIcon;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 55,
        width: 40,
        child: Center(
        child: Icon(
        iconSelected  ? selectedIcon : unselectedIcon,
        color: iconSelected  ?Colors.white : Colors.grey,
    ),),);
  }
}
