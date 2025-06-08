import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/core/utils/app_router.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:task_zen/feature/auth/model/data/repositories/auth_repositiory.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late final AuthRepository _userRepo;
  String userName = '';

  @override
  void initState() {
    super.initState();
    _userRepo = AuthRepository();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    try {
      final user = await _userRepo.getCurrentUser();
      setState(() {
        userName = user?.displayName ?? 'Guest';
      });
    } catch (e) {
      log('Error fetching user name: $e');
      setState(() {
        userName = 'Guest';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: ZSizes.md,
          vertical: ZSizes.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 👤 Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/9720007.jpg'),
              backgroundColor: isDark ? ZColors.greyDark : ZColors.white,
            ),
            const SizedBox(height: ZSizes.md),

            /// 👨‍💼 Name
            Text(
              userName.isNotEmpty ? userName : 'John Doe',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
              ),
            ),

            /// 🔗 Username
            const SizedBox(height: ZSizes.xs),
            Text(
              '@johndoe',
              style: TextStyle(
                fontSize: 16,
                color: isDark ? ZColors.textSecondary : ZColors.textOnPrimary,
              ),
            ),
            const SizedBox(height: ZSizes.lg),

            /// 📊 Stats Row
            _buildStatsRow(),

            const SizedBox(height: ZSizes.lg),

            /// ⚙️ Settings Cards
            _buildSettingsCard(
              context,
              Icons.palette,
              'Appearance',
              'Light / Dark Theme',
            ),
            _buildSettingsCard(
              context,
              Icons.notifications,
              'Notifications',
              'Daily Reminders',
            ),
            _buildSettingsCard(
              context,
              Icons.security,
              'Privacy',
              'Manage your data',
            ),

            const SizedBox(height: ZSizes.lg),

            /// ✏️ Edit Profile
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to Edit Profile Screen
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),

            const SizedBox(height: ZSizes.md),

            /// 🚪 Logout
            TextButton.icon(
              onPressed: () {
                _userRepo
                    .logout()
                    .then((_) {
                      GoRouter.of(context).pushReplacement(AppRouter.loginView);
                    })
                    .catchError((error) {
                      log('Logout failed: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logout failed: $error')),
                      );
                    });
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }

  /// 📊 Task Stats Widget
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('Completed', '24'),
        _buildStatCard('In Progress', '6'),
        _buildStatCard('Pending', '4'),
      ],
    );
  }

  /// 🔹 Individual Stat Card
  Widget _buildStatCard(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  /// 🧾 Settings Card
  Widget _buildSettingsCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: ZColors.primary),
        title: Text(
          title,
          style: TextStyle(color: isDark ? ZColors.white : ZColors.textPrimary),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: isDark ? ZColors.white : ZColors.textPrimary),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Navigate or toggle
        },
      ),
    );
  }
}
