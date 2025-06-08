import 'package:flutter/material.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  static void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark ? ZColors.black : ZColors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Top Profile Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: isDark ? ZColors.greyDark : ZColors.greyLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mohammed Jaber',
                          style: TextStyle(
                            color:
                                isDark
                                    ? ZColors.textOnPrimary
                                    : ZColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Developer | Task Zen',
                          style: TextStyle(
                            color:
                                isDark
                                    ? ZColors.textOnPrimary.withOpacity(0.6)
                                    : ZColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color:
                        isDark
                            ? ZColors.textOnPrimary.withOpacity(0.7)
                            : ZColors.textSecondary,
                  ),
                ],
              ),
            ),

            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _sectionLabel('Main', isDark),
                  _buildDrawerItem(
                    context,
                    icon: Icons.dashboard,
                    title: 'Dashboard',
                    isDark: isDark,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.task_alt,
                    title: 'My Tasks',
                    isDark: isDark,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.calendar_today_outlined,
                    title: 'Calendar',
                    isDark: isDark,
                    onTap: () => Navigator.pop(context),
                  ),

                  const SizedBox(height: 16),
                  _sectionLabel('Preferences', isDark),
                  _buildDrawerItem(
                    context,
                    icon: Icons.settings,
                    title: 'Settings',
                    isDark: isDark,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.brightness_6_outlined,
                    title: 'Theme',
                    isDark: isDark,
                    onTap: () {
                      // Implement theme switching logic
                    },
                  ),

                  const SizedBox(height: 16),
                  _sectionLabel('Support', isDark),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info_outline,
                    title: 'About',
                    isDark: isDark,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help & Feedback',
                    isDark: isDark,
                    onTap: () => Navigator.pop(context),
                  ),

                  const Divider(indent: 16, endIndent: 16, height: 32),
                  _buildDrawerItem(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    isDark: isDark,
                    onTap: () {
                      Navigator.pop(context);
                      // Add logout logic
                    },
                  ),
                ],
              ),
            ),

            // App Version Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Task Zen • v1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color:
                      isDark
                          ? ZColors.textOnPrimary.withOpacity(0.5)
                          : ZColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Drawer Item Builder
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: isDark ? Colors.white10 : ZColors.primary.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Label Widget
  Widget _sectionLabel(String label, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.1,
          color:
              isDark
                  ? ZColors.textOnPrimary.withOpacity(0.5)
                  : ZColors.textSecondary.withOpacity(0.8),
        ),
      ),
    );
  }
}
