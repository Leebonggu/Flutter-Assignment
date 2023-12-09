import 'package:assignment4/constants/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIndex,
  });

  final bool isSelected;
  final IconData icon;
  final Function onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.white,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.5,
            duration: const Duration(milliseconds: 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color: isSelected ? Colors.black : Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
