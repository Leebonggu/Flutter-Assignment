import 'package:assignment4/constants/sizes.dart';
import 'package:assignment4/navigation/widgets/nav_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('body'),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(
            Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.readme,
                onTap: () => _onTap(2),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
