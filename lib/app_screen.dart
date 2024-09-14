import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar_admin_panel/features/banners/view/banner_screen.dart';

import 'features/meals/view/meals_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              _selectedIndex = index;
              setState(() {});
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.photo_size_select_actual_outlined),
                selectedIcon: Icon(Icons.photo_size_select_actual),
                label: Text('Banners'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.local_pizza_outlined),
                selectedIcon: Icon(Icons.local_pizza),
                label: Text('Meals'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          if (_selectedIndex == 0)
            const Expanded(
              child: BannerScreen(),
            ),
          if (_selectedIndex == 1)
            const Expanded(
              child: MealsScreen(),
            )
        ],
      ),
    );
  }
}
