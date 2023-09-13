import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pofy/features/layout/screens/widgets/active_icon.dart';

import '../../../core/palette.dart';

class Layout extends StatelessWidget {
  const Layout({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Palette.teritiary,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            selectedIcon: ActiveIcon(
              icon: Icons.home_outlined,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: ActiveIcon(
              icon: Icons.shopping_cart_outlined,
            ),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
            label: "Marketplace",
          ),
          NavigationDestination(
            selectedIcon: ActiveIcon(
              icon: Icons.person_outline,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            label: "Portfolio",
          ),
          NavigationDestination(
            selectedIcon: ActiveIcon(
              icon: Icons.settings_outlined,
            ),
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
