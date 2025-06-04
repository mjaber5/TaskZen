import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/home/presentation/view/home_view.dart';
import 'package:task_zen/feature/profile/presentation/view/profile_view.dart';

// Enum for navigation items
enum NavItem { home, favorites, add, search, profile }

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _currentIndex = 0;

  // List of views corresponding to navigation items
  static const List<Widget> _views = [HomeView(), ProfileView()];

  // Navigation item configurations
  static const List<Map<String, dynamic>> _navItems = [
    {'icon': Iconsax.home_2, 'label': 'Home', 'semanticLabel': 'Home Screen'},

    {
      'icon': Iconsax.user,
      'label': 'Profile',
      'semanticLabel': 'Profile Screen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true, // Extend body to allow floating effect
      body: _views[_currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CrystalNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index >= 0 && index < _views.length) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          outlineBorderColor: Colors.transparent,
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          borderRadius: 30, // Ensure inner content respects rounded corners
          backgroundColor: ZColors.accent.withOpacity(
            0.19,
          ), // Let the Container handle the background
          indicatorColor:
              isDark
                  ? ZColors.white
                  : ZColors.primary, // Red background for selected item
          selectedItemColor:
              isDark
                  ? ZColors.white.withOpacity(0.7)
                  : ZColors.primary.withOpacity(
                    0.8,
                  ), // White icon for selected item
          unselectedItemColor:
              isDark
                  ? ZColors.accent.withOpacity(
                    0.7,
                  ) // Grayish-white for unselected
                  : ZColors.primary.withOpacity(0.4),
          items:
              _navItems.asMap().entries.map((entry) {
                final item = entry.value;
                return CrystalNavigationBarItem(icon: item['icon'] as IconData);
              }).toList(),
        ),
      ),
    );
  }
}
